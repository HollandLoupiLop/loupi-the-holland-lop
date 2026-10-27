---
name: growth-conversion
description: "ALWAYS use first for any marketing, growth, SEO, ads, affiliate, landing page, pricing page or conversion (CRO) question about DuneQuote, SoloBooks (Falajo) or ChequeMinder — e.g. « augmenter les conversions de la landing ChequeMinder », « mots-clés SoloBooks », « campagne Google Ads DuneQuote ». Loads verified product context (UAE/Gulf, AED, brand books) and then routes to the installed marketingskills and claude-seo skills instead of duplicating them."
---

# Growth & Conversion — couche de pilotage

Cette skill **ne réécrit pas** les méthodes : elle fixe le contexte produit, choisit la bonne skill installée, et impose les garde-fous du groupe.

## 1. Identifier le produit (ne jamais mélanger deux marques)
| Produit | Promesse | URL | Langues |
|---|---|---|---|
| **DuneQuote** | Devis rapides pour freelances/PME UAE-KSA : devis → lien/WhatsApp → signature → relance | dunequote.com | EN (+AR à confirmer) |
| **SoloBooks by Falajo** | Records & Corporate Tax pour solo businesses UAE — « Your books, made simple » | falajo.com/solobooks/ | EN, FR, AR (RTL) |
| **ChequeMinder** | PDC tracker pour gestionnaires immobiliers UAE (chèques postdatés) | falajo.com/chequeminder/ | EN |

Contexte détaillé, offres, brand books et IDs Drive : `references/products.md` (charger avant toute recommandation chiffrée).

## 2. Router vers la skill installée
| Besoin | Skill à invoquer |
|---|---|
| Audit SEO complet / technique | `seo` (orchestrateur claude-seo), `seo-technical`, `seo-audit` |
| Page précise (title, meta, contenu) | `seo-page`, `seo-content`, `seo-schema`, `seo-hreflang` (EN/FR/AR) |
| Visibilité IA (ChatGPT, Perplexity, AI Overviews) | `seo-geo`, `ai-seo` |
| SEO local Golfe | `seo-local`, `seo-maps` |
| Pages modèles à grande échelle (« quotation template UAE ») | `programmatic-seo`, `seo-programmatic` |
| Concurrents (Wafeq, Zoho Invoice, Ledgers…) | `competitor-profiling`, `competitors`, `seo-competitor-pages` |
| Landing / pricing / formulaire | `cro`, `signup`, `pricing`, `paywalls`, `popups` |
| Copy | `copywriting`, `copy-editing` |
| Pub payante | `ads`, `ad-creative`, `conversion-tracking` |
| Affiliation / parrainage | `referrals`, `influencer-marketing`, `co-marketing` |
| Lancement / annuaires | `launch`, `directory-submissions` |
| Emails / onboarding / churn | `emails`, `onboarding`, `churn-prevention` |
| Plan global | `marketing-plan`, `product-marketing` |
| Tracking / mesure | `analytics`, `attribution`, `ab-testing` |
| QA d'interface | `web-design-guidelines` |

Annoncer la skill utilisée, puis l'invoquer via l'outil Skill avec le contexte produit.

## 3. Garde-fous (s'appliquent à toute sortie)
- **Promesses vérifiables uniquement** : pas de « e-invoicing compliant », « conforme FTA/ZATCA », compteur de rareté ou fonctionnalité non livrée sans validation (Juriste IA pour le légal).
- **Aucune action externe** : pas de publication, dépense pub, envoi, changement de site. Livrer des propositions ; exécution par l'agent Grok responsable après ligne `Approvals` (voir skill `ai-group-coo`).
- **Mobile-first** (WhatsApp, Instagram, LinkedIn dominent le Golfe) ; prix en AED ; TVA 5 % UAE ; arabe natif (pas de traduction mot à mot).
- Toute modification de page = checklist QA visuelle avant/après (`ai-group-coo/references/visual-qa-checklist.md`).
- Finir chaque recommandation par : **faits / hypothèses / données manquantes** + métrique de succès.

## 4. Playbooks par levier
`references/playbooks.md` : priorités SEO, acquisition, pub, affiliation et CRO par produit.
