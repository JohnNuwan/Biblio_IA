# 🧭 Arbre de Décision - Quelle Méthode Choisir ?

## Flowchart de Sélection

```
                    ╔═══════════════════════════════════╗
                    ║   Quel est votre type de tâche ?  ║
                    ╚═══════════════════════════════════╝
                                    │
        ┌───────────────┬───────────┼───────────┬───────────────┐
        ▼               ▼           ▼           ▼               ▼
    📊 CALCUL      🔍 RECHERCHE  💻 CODE    🎨 CRÉATIF    🏗️ PROJET
        │               │           │           │               │
        ▼               ▼           ▼           ▼               ▼
  Chain-of-Thought    ReAct    Reflexion   Tree-of-Thoughts   BMAD
```

---

## Guide Détaillé par Besoin

### 🧮 Résolution de Problèmes Logiques

```
Le problème nécessite des calculs ?
├── OUI et complexe → Program-of-Thoughts (génère du code)
├── OUI et simple → Chain-of-Thought (étape par étape)
└── NON mais logique → Plan-and-Solve (planifie d'abord)
```

### 🔍 Recherche d'Information

```
Avez-vous une base de documents ?
├── OUI → RAG (recherche + génération)
│   └── Relations complexes ? → GraphRAG
└── NON
    └── Besoin d'actions ? → ReAct (pensée + action)
    └── Juste réflexion ? → Generated Knowledge
```

### 💻 Développement / Code

```
Le code existe déjà ?
├── OUI - Debugging → Reflexion (apprend des erreurs)
├── OUI - Review → CRITIC (auto-critique)
└── NON - Création
    └── Projet complet ? → BMAD
    └── Fonction simple ? → Chain-of-Thought
```

### 🎨 Créativité / Exploration

```
Besoin d'explorer plusieurs options ?
├── OUI → Tree-of-Thoughts (multi-chemins)
└── NON
    └── Contenu long ? → Skeleton-of-Thought (plan d'abord)
    └── Inspiration ? → Analogical Prompting
```

### ✅ Précision Maximale

```
La précision est critique ?
├── Faits vérifiables → CRITIC (vérification externe)
├── Réponse unique → Self-Consistency (vote)
└── Éthique/sécurité → Constitutional AI
```

---

## Tableau Récapitulatif

| Besoin | Méthode | Quand l'utiliser |
|--------|---------|------------------|
| Calcul étape par étape | **Chain-of-Thought** | Maths, logique |
| Calcul complexe | **Program-of-Thoughts** | Code pour calculer |
| Planification avant | **Plan-and-Solve** | Problèmes multi-variables |
| Simple → Complexe | **Least-to-Most** | Tâches décomposables |
| Mémoire de travail | **Scratchpad** | Calculs multi-étapes |
| Pensée + Action | **ReAct** | Recherche, outils |
| Apprentissage erreurs | **Reflexion** | Code, puzzles |
| Auto-critique | **CRITIC** | Vérification de faits |
| Exploration parallèle | **Tree-of-Thoughts** | Créativité |
| Vote multi-réponses | **Self-Consistency** | Précision critique |
| Structure d'abord | **Skeleton-of-Thought** | Contenu long |
| Éthique | **Constitutional AI** | Sécurité |
| Documents | **RAG** | Q&A sur docs |
| Relations | **GraphRAG** | Données structurées |
| Persona | **Role Prompting** | Expertise spécifique |
| Abstraction | **Step-Back** | Questions complexes |
| Analogie | **Analogical** | Problèmes nouveaux |
| Chaînage | **Prompt Chaining** | Workflows |
| Outils auto | **ART** | Agents autonomes |
| Projet complet | **BMAD** | Développement logiciel |

---

## Aide Rapide

**Je ne sais pas par où commencer →** `Chain-of-Thought`
**J'ai besoin de précision →** `Self-Consistency` + `CRITIC`
**Je construis un système →** `BMAD` + `RAG`
**Je veux de la créativité →** `Tree-of-Thoughts`
