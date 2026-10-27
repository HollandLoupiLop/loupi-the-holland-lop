---
name: video-production-director
description: "ALWAYS use for any short vertical video request — TikTok, Instagram Reels, YouTube Shorts, video ad, storyboard, script de vidéo, hook, montage — for any group brand (DuneQuote, SoloBooks, ChequeMinder, Loupi Gang, Les Aventures de Loupi). End-to-end 9:16 pipeline: storyboard → generation (WanGP, Higgsfield) → Remotion edit → QC, with hook, on-screen text, CTA and caption."
---

# Video Production Director — 9:16

Pipeline : **Brief → Storyboard → Génération → Montage Remotion → QC → Livraison (brouillon)**. Chaque étape a un livrable ; ne pas passer à la suivante sans lui.

## 1. Brief (5 lignes)
Marque · objectif (vue / clic / vente) · plateforme(s) · durée (15/30/45 s) · CTA unique. Contexte marque via `growth-conversion` ou `ecommerce-brand-director`.

## 2. Storyboard
Gabarit : `references/storyboard-template.md`. Règles :
- **Hook 0–2 s** : mouvement + texte qui pose la tension (pas de logo en ouverture).
- 1 idée par plan, plans de 1–3 s, rythme calé sur la musique.
- Texte à l'écran ≤ 7 mots par carton, lisible sans son (85 % des vues en muet).
- CTA dans les 3 dernières secondes + rappel dans la légende.
- Copy des hooks/CTA : skills `ad-creative`, `copywriting` (formats et tier list Reels/TikTok).

## 3. Génération des plans
`references/generation.md` : quand utiliser **Higgsfield** (connecteur MCP : `generate_video`, `generate_image`, `reframe`, `upscale_video` ; toujours vérifier le coût en crédits et le faire valider avant de lancer) vs **WanGP** (local, gratuit, Wan 2.x image→vidéo). Toujours générer en 9:16 natif (1080×1920), seed notée.

## 4. Montage Remotion
Utiliser les skills Remotion installées : `remotion-best-practices` (routeur), `remotion-create`, `remotion-captions` (sous-titres animés), `remotion-render`. Gabarit de composition et zones de sécurité : `references/remotion-9x16.md`.

## 5. Contrôle qualité (bloquant)
Checklist `references/qc-checklist.md` : technique, lisibilité, marque, droits, plateforme. Option : `mcp__Higgsfield__virality_predictor` pour un score de hook/rétention (indicatif).

## 6. Livraison
MP4 H.264 1080×1920 30 fps + vignette + légende (gabarit dans `references/storyboard-template.md`) + 3–5 hashtags. **Pas de publication** (TikTok/Instagram) sans ligne `Approvals` (skill `ai-group-coo`).
