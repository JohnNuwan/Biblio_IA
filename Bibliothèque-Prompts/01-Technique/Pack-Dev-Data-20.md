# Pack Technique : Dev & Data (20 Prompts)

Des prompts optimisés pour le code, le debug et l'architecture.

## 1. Développement & Code Quality

### 🧹 Le Refactorer "Clean Code"
> **Prompt** : "Agis comme un expert Senior (Robert C. Martin). Analyse ce code.
> 1. Identifie les violations des principes SOLID et DRY.
> 2. Repère les fonctions trop longues (Complexité Cyclomatique).
> 3. Propose une version refactorisée, plus lisible et modulaire.
> Code : [COLLER CODE]."

### 🐛 Le Sherlock Holmes (Debug)
> **Prompt** : "J'ai un bug que je n'arrive pas à comprendre.
> Stack Techno : [LANGAGE/FRAMEWORK].
> Symptome : [DESCRIPTION].
> Message d'erreur : [LOGS].
> Ce que j'ai déjà essayé : [ACTIONS].
> Propose-moi 3 causes racines possibles, de la plus probable à la plus exotique, et pour chacune, une commande ou un test pour vérifier l'hypothèse."

### 🧪 Le Testeur Parano (Unit Tests)
> **Prompt** : "Écris les tests unitaires pour cette fonction [FONCTION].
> Ne te contente pas du 'Happy Path'. Je veux que tu testes :
> 1. Les Edge Cases (null, vide, négatif, max int).
> 2. Les types invalides.
> 3. La performance (grands arrays).
> Utilise le framework [JEST/PYTEST]."

---

## 2. DevOps & Infrastructure

### 🐳 Le Dockerizer
> **Prompt** : "Génère un `Dockerfile` optimisé pour une application [NODE/PYTHON/GO].
> Contraintes :
> 1. Utilise le Multi-stage builds pour réduire la taille de l'image finale.
> 2. N'exécute pas en root (User security).
> 3. Optimise le caching des layers (copie package.json avant le code source).
> 4. Ajoute un Healthcheck."

### ☸️ Le Kubernetes Translator
> **Prompt** : "Transforme ce fichier `docker-compose.yml` en manifestes Kubernetes valides (Deployment, Service, Ingress).
> Ajoute des `resources limits` et `requests` raisonnables par défaut.
> Sépare les secrets dans un fichier Secret séparé (placeholder).
> [COLLER DOCKER-COMPOSE]."

---

## 3. Data & SQL

### 📊 Le SQL Optimizer
> **Prompt** : "J'ai cette requête SQL qui est lente (prend 5 secondes).
> Base de données : [POSTGRES/MYSQL].
> Voici la requête : [REQETE].
> Voici le schéma des tables (simplifié) : [SCHEMA].
> 1. Explique pourquoi c'est lent (Full Table Scan ?).
> 2. Réécris la requête pour l'optimiser (Joins, Subqueries).
> 3. Dis-moi quels INDEX je dois créer absolument."

### 🐍 Le Python Data Analyst
> **Prompt** : "J'ai un dataset CSV chargé dans un DataFrame pandas `df`. Colonnes : `['date', 'category', 'amount', 'customer_id']`.
> Donne-moi le code pandas pour :
> 1. Nettoyer les valeurs nulles (fill avec la moyenne ou drop).
> 2. Grouper par mois et par catégorie pour avoir la somme des 'amount'.
> 3. Calculer la variation en % par rapport au mois précédent.
> 4. Utiliser Plotly pour afficher un Line Chart interactif de l'évolution."

---

## 4. Documentation & API

### 📘 Le Swagger Generator
> **Prompt** : "Voici le code de mon API (Route handler) : [CODE].
> Génère la documentation OpenAPI (Swagger) en YAML.
> Inclue :
> 1. La description des paramètres.
> 2. Les exemples de réponse (200, 400, 500).
> 3. Les schémas de données."
