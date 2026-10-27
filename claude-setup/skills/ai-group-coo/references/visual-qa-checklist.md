# Checklist QA visuelle avant/après déploiement

**Règle d'or : pas de captures AVANT → pas de déploiement.** Claude ne déploie jamais ; il vérifie et donne un avis GO / NO-GO.

## AVANT (sur la production actuelle, avant toute modification)
- [ ] Captures pleine page **desktop 1440×900** et **mobile 390×844** de chaque page touchée.
- [ ] Captures des états clés : menu ouvert, formulaire (vide + erreur), panier/checkout, popup/bannière cookies.
- [ ] Nommage : `<MISSION_ID>_<page>_<device>_AVANT_<AAAAMMJJ>.png`, rangées dans un sous-dossier Drive de la mission ; lien ajouté au checkpoint (section Références).
- [ ] Mesures de référence notées : LCP/CLS (PageSpeed), taux de conversion de la page si dispo.

## APRÈS (sur préproduction / aperçu, puis sur production après GO)
- [ ] Mêmes captures, mêmes tailles, mêmes états, suffixe `_APRES_`.
- [ ] Comparaison côte à côte, écart noté par page : mise en page, typographie, couleurs de marque, images (pas d'image cassée/étirée), textes (pas de lorem, pas de faute, bonne langue FR/EN/AR).
- [ ] Mobile : pas de scroll horizontal, boutons ≥ 44 px, CTA visible au-dessus de la ligne de flottaison.
- [ ] Liens et CTA cliqués (aucun 404), formulaires testés avec une donnée fictive, tracking (événement de conversion) qui part.
- [ ] Accessibilité rapide : contraste, alt des images, focus clavier (skill `web-design-guidelines` si code dispo).
- [ ] SEO : title/meta/canonical/hreflang inchangés ou améliorés (skill `seo-page`).
- [ ] Performance : LCP/CLS pas dégradés vs AVANT.

## Décision
- [ ] Ligne `Approvals` créée pour le déploiement (approbateur = Ma).
- [ ] Avis écrit dans le thread : `REPONSE | <agent exécutant> | QA <page> | GO / NO-GO + 3 points max | <liens captures>`.
- [ ] Plan de retour arrière identifié (version précédente / thème dupliqué Shopify / commit).
- [ ] Après mise en prod : captures APRÈS prod + vérification à H+24 (erreurs, conversions).
