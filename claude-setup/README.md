# Skills Claude Code : audit et installation (27/10/2026)

L'installation a été faite dans une **session cloud éphémère** de Claude Code. Pour retrouver les mêmes skills sur ta machine, lance `./install-skills.sh` : chaque dépôt y est épinglé sur le commit audité.

## Audit des dépôts

| Dépôt | Dernier commit | Commit audité | Code exécutable / réseau | Verdict |
|---|---|---|---|---|
| obra/superpowers | 21/10/2026 | `2ce8aa1` (v7.0.1) | Hook SessionStart (injecte using-superpowers ; actif seulement en mode plugin). Serveur de brainstorming local sur 127.0.0.1 avec jeton. Un seul appel externe : le logo sur primeradiant.com. | ✅ Installé (15 skills) |
| vercel-labs/agent-skills → web-design-guidelines | 26/10/2026 | `6ec2693` | Aucun script. Récupère ses règles à chaque usage sur raw.githubusercontent.com/vercel-labs. | ✅ Installé |
| coreyhaines31/marketingskills | 26/10/2026 | `17772c7` (v2.13.5) | Snippets JS et scripts Python locaux, aucun appel automatique. ⚠ Il mentionne des partenaires sponsorisés (Converly, Ploy, AISA, Omnia), ce qui biaise certaines recommandations d'outils. | ✅ Installé (51/52, `seo-audit` laissé à claude-seo) |
| AgriciDaniel/claude-seo | 22/10/2026 | tag `v2.5.0` (= HEAD sauf README) | `install.sh` lu : il copie dans ~/.claude/skills et ~/.claude/agents, puis crée un venv Python (requests, playwright, google-api…). Les appels réseau vont seulement vers les sites audités et les API que tu actives (Google, Moz, DataForSEO…). Pas de télémétrie. Il ne touche ni settings.json ni MCP. | ✅ Installé (34 skills + 20 agents) |
| remotion-dev/skills | 26/10/2026 | `30d4553` (4.0.539) | 2 scripts .mjs de préparation geo (fichiers locaux). | ✅ Installé (12 skills) |
| vercel-labs → react-best-practices | n/a | n/a | n/a | ❌ Non installé : `gh` n'est pas authentifié dans la session (token invalide), donc impossible de vérifier le package.json du dépôt privé cible |
| anthropics/claude-code-security-review | **11/02/2026** (plus de 8 mois) | `0c6a49f` | Action GitHub composite | ⚠ Workflow préparé comme modèle (`security/`, hors `.github/workflows`, donc inactif). À réauditer avant de l'activer. |

Exclus à ta demande : anthropics/skills, React Native, UI/UX Pro Max.

## Skills perso (`skills/`, version publique : prix, IDs et données internes sont lus dans Google Drive au moment de l'usage)

| Skill | Usage |
|---|---|
| `ai-group-coo` | Coordination multi-IA : alertes Apps Script, checkpoints HQ/DQ, délégation, reprise, QA visuelle avant/après |
| `growth-conversion` | DuneQuote, SoloBooks, ChequeMinder. Route vers les skills marketingskills et claude-seo. |
| `ecommerce-brand-director` | Loupi Gang (Shopify/Printful, US) et Les Aventures de Loupi (KDP) |
| `video-production-director` | Vidéos 9:16 : storyboard, puis WanGP/Higgsfield, montage Remotion et QC |

## Nombre de skills

Au-delà d'environ 100 skills, Claude Code tronque les descriptions et certaines skills ne se déclenchent plus. Le script retire donc :
- les 11 sous-skills Remotion, déjà incluses dans `remotion-best-practices` ;
- les 6 extensions claude-seo qui demandent une clé API payante (ahrefs, dataforseo, firecrawl, matomo, profound, seranking).

Résultat : 99 skills, et les 4 skills perso se déclenchent seules (5 tests sur 5).

## Sessions cloud : installation automatique

`cloud-hook/` contient un hook SessionStart prêt à l'emploi. Pour l'activer, copie `cloud-hook/session-start.sh` dans `.claude/hooks/` et `cloud-hook/settings.json` dans `.claude/`, puis fusionne dans `main`. Le premier démarrage prend environ 4 minutes ; ensuite c'est instantané, tant que le script et les skills ne changent pas.

## Sécurité

- `security/ai-trading-desk-security-review.yml` : à copier dans `.github/workflows/` du futur dépôt AI Trading Desk. Il faut aussi créer le secret `CLAUDE_API_KEY`.
- `security/trading-scan.txt` : consignes de scan propres au trading (optionnel).
