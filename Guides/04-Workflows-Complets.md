# 🔄 Workflows Complets - Exemples Pratiques

## Workflow 1 : Créer une Application avec BMAD

```
📥 Besoin client : "Je veux une app de gestion de tâches"
     │
     ▼
🧑‍💼 AGENT ANALYSTE (Brief)
     → Output: 01_project_brief.md
     │
     ▼
📋 AGENT PM (PRD)
     → Output: 02_prd.md
     │
     ▼
🏗️ AGENT ARCHITECTE (Design)
     → Output: 03_architecture.md + 04_tech_stack.md
     │
     ▼
💻 AGENT DÉVELOPPEUR (Code)
     → Output: Code source complet
     │
     ▼
✅ Résultat : Application fonctionnelle
```

---

## Workflow 2 : Recherche + Rapport avec ReAct + RAG

```
📥 Question : "Quelles sont les tendances IA en 2024 ?"
     │
     ▼
🔍 REACT : Pensée → "Je dois chercher des sources récentes"
     │
     ▼
⚡ ACTION : search("tendances IA 2024")
     │
     ▼
👁️ OBSERVATION : [Liste d'articles]
     │
     ▼
🔍 REACT : Pensée → "Je dois synthétiser ces sources"
     │
     ▼
📚 RAG : Indexer les articles → Générer synthèse
     │
     ▼
📄 Résultat : Rapport avec sources citées
```

---

## Workflow 3 : Résoudre un Bug avec Reflexion

```
📥 Bug : "L'API renvoie une erreur 500"
     │
     ▼
💻 TENTATIVE 1 : Vérifier les logs
     │
     ▼
❌ ÉCHEC : Log pas assez détaillé
     │
     ▼
🔄 RÉFLEXION : "Je dois ajouter plus de logging"
     │
     ▼
💻 TENTATIVE 2 : Ajouter try/catch + logs détaillés
     │
     ▼
✅ SUCCÈS : Trouvé NPE ligne 45
     │
     ▼
📝 MÉMOIRE : "Toujours vérifier les null avant d'accéder"
```

---

## Workflow 4 : Rédiger un Document Long avec Skeleton-of-Thought

```
📥 Demande : "Rédige un guide utilisateur de 30 pages"
     │
     ▼
🦴 SQUELETTE :
     1. Introduction
     2. Installation
     3. Fonctionnalités
     4. FAQ
     │
     ├──── Section 1 → Rédacteur → Contenu
     ├──── Section 2 → Rédacteur → Contenu
     ├──── Section 3 → Rédacteur → Contenu
     └──── Section 4 → Rédacteur → Contenu
     │
     ▼
🔗 ASSEMBLAGE : Transitions + Cohérence
     │
     ▼
📄 Résultat : Document complet et structuré
```

---

## Workflow 5 : Valider une Réponse Critique avec Self-Consistency + CRITIC

```
📥 Question : "Quelle est la dose maximale de X ?"
     │
     ▼
🎲 SELF-CONSISTENCY : Générer 5 réponses
     │
     ├── Réponse 1 : 500mg
     ├── Réponse 2 : 500mg  
     ├── Réponse 3 : 400mg
     ├── Réponse 4 : 500mg
     └── Réponse 5 : 500mg
     │
     ▼
🗳️ VOTE : 500mg (80%)
     │
     ▼
🔍 CRITIC : Vérifier avec source médicale
     │
     ▼
✅ Validé : Conforme au Vidal
     │
     ▼
📄 Réponse finale avec source
```

---

## Combiner les Méthodes

| Combinaison | Cas d'usage |
|-------------|-------------|
| ReAct + RAG | Recherche documentaire intelligente |
| CoT + Self-Consistency | Calculs précis |
| BMAD + Reflexion | Développement itératif |
| ToT + CRITIC | Créativité contrôlée |
| SoT + Role Prompting | Contenu expert long |
