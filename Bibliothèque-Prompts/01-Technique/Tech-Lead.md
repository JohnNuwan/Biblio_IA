# 🛠️ Prompts Tech Lead / Architecte

## 1. Architecture Technique

```
Conçois l'architecture technique pour : [PROJET]

**Contexte :**
- Type : [Web/Mobile/API/Data/...]
- Utilisateurs : [Nombre, profil]
- Charge : [Requêtes/jour]
- Contraintes : [Budget, délai, équipe]

Propose :
1. Schéma d'architecture (ASCII)
2. Stack technique justifiée
3. Patterns utilisés
4. Points de scalabilité
5. Sécurité
6. Coût estimé (Cloud)
```

---

## 2. Revue de Design Technique

```
Revois ce design technique et donne ton feedback.

**Design proposé :**
[DESCRIPTION OU SCHÉMA]

Évalue :
1. Adéquation au besoin
2. Scalabilité
3. Maintenabilité
4. Sécurité
5. Performance
6. Coût

Format : Points positifs + Points d'amélioration + Verdict
```

---

## 3. Décision Technique (ADR)

```
Rédige un ADR (Architecture Decision Record) pour : [DÉCISION]

**Contexte :**
[POURQUOI CETTE DÉCISION]

**Options considérées :**
1. [Option A]
2. [Option B]
3. [Option C]

Format ADR :
- Titre
- Statut : [Proposé/Accepté/Déprécié]
- Contexte
- Décision
- Conséquences
```

---

## 4. Estimation Technique

```
Estime l'effort de développement pour : [FONCTIONNALITÉ/PROJET]

**Spécifications :**
[DESCRIPTION]

**Équipe :** [Profils disponibles]
**Stack :** [Technologies]

Fournis :
1. Décomposition en tâches
2. Estimation par tâche (jours-homme)
3. Risques qui impactent l'estimation
4. Total + marge de sécurité (x1.5 ou x2)
```

---

## 5. Onboarding Technique

```
Crée un guide d'onboarding technique pour un nouveau développeur.

**Stack :** [TECHNOLOGIES]
**Projet :** [NOM]

Inclus :
1. Setup environnement (step-by-step)
2. Architecture du projet
3. Conventions de code
4. Workflow Git
5. Outils et accès nécessaires
6. Premier ticket à faire
7. Contacts clés
```

---

## 6. Code Standards / Guidelines

```
Rédige les conventions de code pour notre projet [LANGAGE].

**Équipe :** [Niveau moyen]
**Outils :** [Linter, Formatter]

Couvre :
1. Nommage
2. Organisation des fichiers
3. Patterns à utiliser
4. Anti-patterns à éviter
5. Documentation
6. Tests
7. Git conventions
```

---

## 7. Plan de Migration

```
Élabore un plan de migration de [SOURCE] vers [CIBLE].

**Contexte :**
- Système actuel : [DESCRIPTION]
- Système cible : [DESCRIPTION]
- Contraintes : [Downtime max, données sensibles, etc.]

Plan :
1. Analyse de l'existant
2. Mapping source → cible
3. Stratégie de migration (big bang/progressive)
4. Tests
5. Rollback plan
6. Go/No-go checklist
```

---

## 8. Résolution d'Incident (Post-Mortem)

```
Rédige un post-mortem pour l'incident [NOM].

**Date :** [DATE]
**Durée :** [DURÉE]
**Impact :** [IMPACT]

Structure :
1. Résumé
2. Timeline des événements
3. Cause racine (5 Whys)
4. Ce qui a fonctionné
5. Ce qui n'a pas fonctionné
6. Actions correctives
7. Métriques d'amélioration
```

---

## 9. Mentoring Technique

```
Crée un plan de montée en compétences pour [PROFIL].

**Niveau actuel :** [Junior/Mid]
**Objectif :** [Senior/Lead/Expert X]
**Durée :** [X mois]

Plan :
1. Compétences à acquérir
2. Ressources d'apprentissage
3. Projets pratiques
4. Points de suivi
5. Critères de validation
```

---

## 10. Technical Debt

```
Évalue et priorise la dette technique de [PROJET].

**Éléments identifiés :**
- [Dette 1]
- [Dette 2]

Pour chaque élément :
| Dette | Impact | Effort | Risque si non traité | Priorité |
|-------|--------|--------|---------------------|----------|
| ... | H/M/L | H/M/L | ... | 1-5 |

Propose un plan de résorption réaliste.
```
