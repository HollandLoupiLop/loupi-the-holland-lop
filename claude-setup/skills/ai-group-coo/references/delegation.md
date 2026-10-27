# Délégation

## Qui fait quoi (onglet Agents — source de vérité, relire avant de déléguer)
| agent_id | Capacités | Marques | Niveau |
|---|---|---|---|
| AI COO | coordination, arbitrage, validation ; reçoit les escalades | toutes | exécuter-interne |
| Dune Quote | produit, marketing, ventes DuneQuote | DuneQuote | exécuter-interne |
| Juriste IA | juridique, conformité, relecture | toutes | conseil |
| Digital Manager | SEO, social, tracking | toutes | proposer |
| ChatGPT | avis, revue | HQ, DuneQuote (pilote) | conseil — n'exécute jamais |
| Claude | avis, revue | HQ, DuneQuote (pilote) | conseil — n'exécute jamais |

Les rôles évoluent : si l'onglet Agents diffère de ce tableau, **l'onglet gagne**.

## Choisir le destinataire
1. Capacité requise → agent actif qui la possède.
2. Marque autorisée pour cet agent.
3. Niveau d'autorisation ≥ celui de la mission (une délégation n'élargit jamais les droits).
4. Un seul agent ciblé ; second avis seulement si nécessaire.
5. Doute ou conflit → `TO = AI COO` (arbitrage).

## Format d'une délégation (ligne Messages)
`DELEGATION | <agent_id> | <problème en 1 phrase> | <livrable attendu + critère de fin + échéance> | <lien checkpoint>`

Exemple :
`DELEGATION | Digital Manager | Pas de balises title/meta sur /pricing | Proposition title+meta FR/EN, ≤60/155 car., avant J+2 | https://docs.google.com/...`

## Limites (README HQ)
- Max 4 sauts par thread ; 2 tours de clarification puis ESCALADE vers AI COO.
- Un agent ne répond jamais à son propre message ; pas de ping-pong.
- ~500 caractères par message ; contexte long seulement avec `contexte_long = oui` + justification.
