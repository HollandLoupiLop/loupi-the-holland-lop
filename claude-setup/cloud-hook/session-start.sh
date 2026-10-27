#!/bin/bash
# Installe les skills auditées (claude-setup/) dans ~/.claude/skills au
# démarrage des sessions cloud. Ne réinstalle que si la version a changé.
# Activation : copier ce fichier dans .claude/hooks/ et settings.json dans .claude/.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

SETUP="$CLAUDE_PROJECT_DIR/claude-setup"
MARKER="$HOME/.claude/skills/.claude-setup-version"
VERSION="$(cat "$SETUP/install-skills.sh" "$SETUP"/skills/*/SKILL.md | sha256sum | cut -c1-16)"

if [ -f "$MARKER" ] && [ "$(cat "$MARKER")" = "$VERSION" ]; then
  exit 0
fi

bash "$SETUP/install-skills.sh" >&2
echo "$VERSION" > "$MARKER"
