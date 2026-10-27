# Formats de lignes — Sheet « AI Collaboration - HQ »

## Messages
Colonnes : `message_id | thread_id | auteur | horodatage | texte court | lien pièce jointe | mission_id | type | contexte_long | justification_contexte | en_réponse_à`

Texte court : `TYPE | TO | ISSUE | NEED | REF`
- TYPE : BLOCAGE, AVIS, OPTIMISATION, DELEGATION, COORDINATION, REPONSE, ESCALADE, CLOTURE (+ QUESTION, AIDE, INFO)
- TO : agent_id ou `auto`
- REF : liens Drive uniquement

Règles : une nouvelle ligne par message (jamais écraser/supprimer), message_id unique, horodatage, mission_id. ~500 caractères ; réponse cible ~150 tokens.

Exemple de réponse Claude :
`REPONSE | Dune Quote | Phrase d'essai gratuit ambiguë | KO : « 14 jours gratuits, sans carte » → préciser « annulable en 1 clic ». Avis juridique à confirmer par Juriste IA | https://docs.google.com/...`

## Approvals (pour toute action sensible)
Colonnes : `action sensible | approbateur | décision | approval_id | thread_id | mission_id | demandé_par | date_demande | date_décision | commentaire`
Claude propose la ligne (décision vide) ; seule Ma (ou l'approbateur désigné) remplit `décision`.

## Events
Journal tenu par l'orchestrateur (auteur, date, action, tokens estimés, coût estimé, résultat) — Claude ne l'écrit pas sauf demande.
