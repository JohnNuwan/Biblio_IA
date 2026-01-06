# 💻 Prompts Développement

## 1. Code Review

```
Tu es un développeur senior avec 15 ans d'expérience. Analyse ce code et fournis une revue détaillée.

Code à analyser :
```[LANGAGE]
[CODE]
```

Évalue selon ces critères :
1. **Lisibilité** : Le code est-il clair ?
2. **Performance** : Y a-t-il des optimisations possibles ?
3. **Sécurité** : Y a-t-il des vulnérabilités ?
4. **Maintenabilité** : Le code sera-t-il facile à maintenir ?
5. **Tests** : Le code est-il testable ?

Format :
- ✅ Points positifs
- ⚠️ Points à améliorer (avec suggestions)
- 🔴 Problèmes critiques
```

---

## 2. Debugging

```
Tu es un expert en debugging. Aide-moi à résoudre ce bug.

**Langage/Framework :** [LANGAGE]

**Comportement attendu :**
[DESCRIPTION]

**Comportement actuel :**
[DESCRIPTION]

**Code concerné :**
```[LANGAGE]
[CODE]
```

**Message d'erreur (si applicable) :**
[ERREUR]

Analyse le problème étape par étape et propose une solution.
```

---

## 3. Génération de Tests Unitaires

```
Génère des tests unitaires pour ce code.

**Framework de test :** [pytest/jest/junit/...]

**Code à tester :**
```[LANGAGE]
[CODE]
```

Inclus :
- Tests des cas nominaux
- Tests des cas limites (edge cases)
- Tests des erreurs
- Mocks si nécessaire

Ajoute des commentaires expliquant chaque test.
```

---

## 4. Refactoring

```
Refactorise ce code pour améliorer sa qualité.

**Objectifs prioritaires :** [lisibilité/performance/DRY/SOLID]

**Code actuel :**
```[LANGAGE]
[CODE]
```

Fournis :
1. Le code refactorisé
2. Explication des changements
3. Avantages du nouveau code
```

---

## 5. Explication de Code

```
Explique ce code comme si tu t'adressais à un [débutant/développeur junior/développeur senior].

```[LANGAGE]
[CODE]
```

Structure ton explication :
1. Vue d'ensemble (que fait ce code ?)
2. Explication ligne par ligne
3. Concepts clés utilisés
4. Cas d'utilisation typiques
```

---

## 6. Conversion de Langage

```
Convertis ce code de [LANGAGE_SOURCE] vers [LANGAGE_CIBLE].

**Code source :**
```[LANGAGE_SOURCE]
[CODE]
```

Garde la même logique et adapte les idiomes au langage cible.
Explique les différences majeures si nécessaire.
```

---

## 7. Optimisation de Performance

```
Optimise ce code pour améliorer ses performances.

**Contexte :** [Volume de données attendu, contraintes mémoire, etc.]

**Code actuel :**
```[LANGAGE]
[CODE]
```

Fournis :
1. Code optimisé
2. Complexité avant/après (Big O)
3. Benchmarks estimés
4. Trade-offs éventuels
```

---

## 8. Architecture / Design Pattern

```
Propose une architecture pour ce projet.

**Contexte :**
- Type : [API/Application web/CLI/...]
- Langage : [LANGAGE]
- Équipe : [Taille équipe]
- Contraintes : [Scalabilité, offline, etc.]

**Fonctionnalités principales :**
- [Feature 1]
- [Feature 2]
...

Inclus :
- Structure des dossiers
- Design patterns recommandés
- Technologies suggérées
- Diagramme ASCII si utile
```

---

## 9. Requête SQL

```
Écris une requête SQL pour : [BESOIN]

**Tables disponibles :**
- [table1] : [colonnes]
- [table2] : [colonnes]

**SGBD :** [PostgreSQL/MySQL/SQLite/...]

Optimise pour la performance et explique la requête.
```

---

## 10. Regex

```
Crée une expression régulière pour : [BESOIN]

**Exemples qui doivent matcher :**
- [exemple1]
- [exemple2]

**Exemples qui NE doivent PAS matcher :**
- [exemple3]
- [exemple4]

**Langage :** [JavaScript/Python/...]

Explique chaque partie de la regex.
```
