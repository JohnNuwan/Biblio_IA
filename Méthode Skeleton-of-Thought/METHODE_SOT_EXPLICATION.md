# LA MÉTHODE Skeleton-of-Thought
### Guide de Référence pour la Génération Structurée

## 1. Qu'est-ce que la méthode Skeleton-of-Thought ?

La **méthode Skeleton-of-Thought** (Squelette de Pensée) génère d'abord un **plan/squelette** de la réponse, puis **remplit chaque section** en parallèle.

Son principe fondateur est le **"Outline First"** (Plan d'abord).
* **Règle d'or :** Structurer avant de détailler.
* **Communication :** Le squelette guide la génération du contenu.

---

## 2. Le Workflow Skeleton-of-Thought

```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│  📥 QUESTION                                               │
│       │                                                    │
│       ▼                                                    │
│  🦴 SQUELETTISEUR ──► Génère le plan                      │
│       │                                                    │
│       ├──────────────┬──────────────┐                     │
│       ▼              ▼              ▼                     │
│  📝 Section 1   📝 Section 2   📝 Section 3              │
│  (en parallèle) (en parallèle) (en parallèle)            │
│       │              │              │                     │
│       └──────────────┼──────────────┘                     │
│                      ▼                                     │
│               🔗 ASSEMBLEUR                                │
│                      │                                     │
│                      ▼                                     │
│               📤 RÉPONSE COMPLÈTE                          │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## 3. Les Agents Skeleton-of-Thought

### 🔹 Agent Squelettiseur
* **Rôle :** Créer le plan/structure de la réponse.
* **Output :** Liste des sections avec titres.

### 🔹 Agent Rédacteur
* **Rôle :** Rédiger le contenu d'une section.
* **Output :** Contenu détaillé de la section.

### 🔹 Agent Assembleur
* **Rôle :** Combiner toutes les sections.
* **Output :** Réponse finale cohérente.

---

## 4. Exemple Concret

**Question :** "Explique les avantages de Python pour le machine learning"

### Squelette :
1. Introduction
2. Bibliothèques riches
3. Communauté active
4. Facilité d'apprentissage
5. Conclusion

### Remplissage parallèle :
```
Section 2: "Python dispose de bibliothèques comme NumPy, Pandas, 
            Scikit-learn, TensorFlow et PyTorch..."

Section 3: "La communauté Python est très active avec Stack Overflow,
            GitHub, et de nombreux tutoriels..."
            
Section 4: "La syntaxe simple de Python permet aux débutants..."
```

### Assemblage final :
> Python est devenu le langage de référence pour le machine learning...
> [Section 1] + [Section 2] + [Section 3] + [Section 4] + [Section 5]

---

## 5. Avantages et Inconvénients

### ✅ Avantages
- **Parallélisation** : Génération simultanée des sections
- **Cohérence** : Structure définie à l'avance
- **Rapidité** : Jusqu'à 2x plus rapide

### ❌ Inconvénients
- **Rigidité** : Structure fixée trop tôt
- **Transitions** : Peut manquer de fluidité
- **Complexité** : Nécessite orchestration

---

## 6. Quand l'utiliser ?

Utilisez Skeleton-of-Thought si :
1. La réponse doit être **longue et structurée**
2. Vous voulez **accélérer** la génération
3. La **structure** est importante
4. Les sections sont **indépendantes**
