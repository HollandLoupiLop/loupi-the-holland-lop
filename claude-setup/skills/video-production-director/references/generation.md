# Génération des plans

## Higgsfield (connecteur MCP disponible)
- Usage : plans produits stylisés, mouvements caméra cinématiques, UGC/AI influencer, reframe 16:9 → 9:16, upscale.
- Procédure : `models_explore(action:'recommend')` si doute sur le modèle → vérifier `balance` et le coût → **validation du coût par Ma (Approvals si > budget convenu)** → `generate_video` / `generate_video_batch` → `jobs_wait` → `show_generation_by_ids`.
- Toujours 9:16, noter modèle + prompt + seed dans le storyboard.
- Pas de visage réel identifiable sans consentement ; pas de marque/personnage tiers.

## WanGP (local, open source — Wan 2.x via interface Gradio)
- Usage : volume, itérations gratuites, image→vidéo à partir des visuels de marque (mockups Printful, illustrations Loupi).
- Réglages de départ : résolution 720×1280 puis upscale ; 81 frames (~5 s à 16 fps) ; prompt = sujet + action + caméra + lumière ; négatif : « text, watermark, deformed hands ».
- Tourne sur la machine de Ma (GPU) : Claude prépare les prompts et paramètres, Ma lance.

## Prompt vidéo (structure)
`[sujet précis] + [action] + [caméra : dolly-in / orbit / handheld] + [lumière] + [style] + [durée] , vertical 9:16`
