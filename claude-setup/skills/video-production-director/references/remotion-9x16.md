# Remotion — composition 9:16

- Composition : `width=1080 height=1920 fps=30`, durée = somme des plans.
- Zones de sécurité (UI TikTok/Reels) : garder texte et CTA entre **y = 220 et y = 1500**, marges latérales 60 px ; rien d'important dans les 400 px du bas (légende + boutons).
- Texte : police de la marque, ≥ 64 px, contour ou fond semi-opaque, animé par `spring()` / `interpolate()`.
- Sous-titres : skill `remotion-captions` (transcription Whisper ou SRT), 1–3 mots à la fois, mot actif surligné couleur de marque.
- Plans générés : `<OffthreadVideo>` dans `<Sequence>` ; musique `<Audio>` avec fondu.
- Rendu : skill `remotion-render` → `npx remotion render <id> out/<marque>_<sujet>_v<n>.mp4 --codec h264`.
- Prévisualisation : skill `remotion-studio`.
