#!/usr/bin/env bash
# Reproduit sur ta machine l'installation auditée le 2026-10-27.
# Chaque dépôt est épinglé sur le commit audité (claude-seo : tag v2.5.0, que son
# install.sh re-clone lui-même) : une mise à jour amont n'est
# jamais installée sans nouvel audit. N'écrit que dans ~/.claude/skills et
# ~/.claude/agents (claude-seo) ; aucune config, aucun MCP, aucun settings.json.
set -euo pipefail

SKILLS="${HOME}/.claude/skills"
HERE="$(cd "$(dirname "$0")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf -- "$TMP"' EXIT
mkdir -p "$SKILLS"

fetch() { # owner/repo sha dir
  git init -q "$TMP/$3"
  git -C "$TMP/$3" fetch -q --depth 1 "https://github.com/$1" "$2"
  git -C "$TMP/$3" checkout -q FETCH_HEAD
}

fetch obra/superpowers               2ce8aa15d05bd57213e6f746f953aafb7ded7a8b superpowers
fetch vercel-labs/agent-skills       6ec269328bc400712ee225a173a14b6b29128df7 vercel
fetch coreyhaines31/marketingskills  17772c7a80b7b8c7a47af30f648374cd8bd8adc5 marketing
fetch remotion-dev/skills            30d4553ecd46fbc5212fd0ff006ae43af522158b remotion

cp -r "$TMP/superpowers/skills/"* "$SKILLS/"
cp -r "$TMP/vercel/skills/web-design-guidelines" "$SKILLS/"
# seo-audit existe aussi dans claude-seo : on garde celui de claude-seo.
rm -rf "$TMP/marketing/skills/seo-audit"
cp -r "$TMP/marketing/skills/"* "$SKILLS/"
cp -r "$TMP/remotion/skills/"* "$SKILLS/"

# claude-seo : install.sh audité, épinglé sur le tag v2.5.0 (crée un venv Python
# et télécharge Chromium pour Playwright).
rm -rf "$SKILLS/seo-audit"
git clone -q --depth 1 --branch v2.5.0 https://github.com/AgriciDaniel/claude-seo "$TMP/claude-seo"
CLAUDE_SEO_TAG=v2.5.0 bash "$TMP/claude-seo/install.sh"

# Allège la liste : au-delà d'environ 100 skills, Claude Code tronque les
# descriptions et certaines ne se déclenchent plus.
# - sous-skills Remotion déjà incluses dans remotion-best-practices ;
# - extensions claude-seo qui exigent une clé API payante non configurée.
for s in remotion-captions remotion-create remotion-docs remotion-interactivity \
         remotion-maps remotion-markup remotion-multimedia remotion-render \
         remotion-saas remotion-studio remotion-upgrade \
         seo-ahrefs seo-dataforseo seo-firecrawl seo-matomo seo-profound seo-seranking; do
  rm -rf "${SKILLS:?}/$s"
done

# Skills perso (version publique, sans données internes : elles lisent Drive).
cp -r "$HERE/skills/"* "$SKILLS/"

echo "OK — $(ls "$SKILLS" | wc -l) skills dans $SKILLS. Redémarre Claude Code."
