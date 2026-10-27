# Format de checkpoint (v1 — aligné sur « 00 - Modèle checkpoint »)

Nom du Doc : `<MISSION_ID> — <objectif court>` (ex. `DQ-0001 — Refonte page Pricing`), dans le dossier « AI Collaboration - Checkpoints ».
Cible < 1 500 tokens. Aucun secret, aucune liste de prospects, aucune copie de document (liens uniquement).

```markdown
# <MISSION_ID> — <objectif court>

## 1. Identité
- Mission ID : <HQ-0001 / DQ-0001>
- Marque : <HQ / DuneQuote / SoloBooks / ChequeMinder / Loupi Gang / Les Aventures de Loupi>
- Objectif : <1 phrase, résultat attendu>
- Agent initial : <agent_id>
- Agent actuel (= verrou) : <agent_id> — seul cet agent exécute ; les autres lisent seulement.
- Statut : <à faire / en cours / en attente validation / bloqué / clôturé>

## 2. Étapes terminées
1. <étape> — <date> — <agent>

## 3. Livrables
- <nom> — <lien Drive>

## 4. Décisions prises
- <décision> — <qui> — <date / approval_id>

## 5. Contraintes et autorisations
- Autorisé : <…>
- Interdit : <…>
- Toute action sensible (dépense, publication, envoi externe, production, données sensibles) passe par l'onglet Approvals.
- Une passation n'élargit jamais ces autorisations (on applique les plus restrictives).

## 6. Prochaine action (une seule, concrète)
- <verbe + objet + critère de fin>

## 7. Références indispensables (liens uniquement)
- <lien>

## 8. Journal des passations
| Date | De | Vers | Raison |
|---|---|---|---|
| AAAA-MM-JJ HH:MM (UTC+4) | | | |

## 9. Dernière mise à jour
AAAA-MM-JJ HH:MM (UTC+4) — <agent>
```

## Règles de mise à jour
- À chaque jalon **et avant de s'arrêter** (fin de session, blocage, quota) : sections 2, 3, 4, 6, 9.
- Synchroniser la ligne du **Mission Checkpoint Registry** (colonnes : Mission ID, Agent initial, Agent actuel, Objectif, Étapes terminées, Références indispensables, Prochaine action, État du transfert, Historique des basculements, verrou_par, verrou_jusqu_a, marque, thread_id, niveau_autorisation_mission, dernière_maj, lien_checkpoint, statut).
- Si Claude ne peut pas écrire : rendre le bloc complet, prêt à coller, et le signaler.
- Horodatage en UTC+4 (Dubaï).
