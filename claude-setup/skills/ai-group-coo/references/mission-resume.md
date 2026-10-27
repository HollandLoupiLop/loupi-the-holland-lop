# Reprise de mission (Manual AI Handover)

Mode manuel prioritaire (Config : `failover_auto = non`).

## Quand Claude reprend une mission
Déclencheur type : « Reprends la mission DQ-0001 … ».
1. Chercher dans Drive le Doc dont le nom commence par l'ID, dans « AI Collaboration - Checkpoints ».
2. Lire le checkpoint ; **confirmer en 3 lignes** : (1) état/statut, (2) dernière étape terminée, (3) prochaine action.
3. Mettre « Agent actuel » = Claude + ligne au journal des passations (date UTC+4, de, vers, raison).
4. Respecter les autorisations du checkpoint (les plus restrictives entre celles de Claude = conseil et celles de la mission).
5. Mettre à jour le checkpoint à chaque étape. Si écriture impossible → rendre le bloc complet prêt à coller.

## Rendre la mission à l'agent initial
- L'agent initial remplace « Agent actuel » par son nom et ajoute une ligne « retour à l'agent initial ».
- Claude arrête immédiatement et ne fait plus que lire.

## Anti double exécution
- « Agent actuel » = verrou. Avant toute action : relire ce champ. Pas son nom → stop + signaler.
- Un seul changement d'agent actuel à la fois, toujours journalisé.
- Failover automatique (quand activé) : uniquement sur signaux réels (HTTP 429/529/5xx, quota, timeout, échec webhook Grok).
