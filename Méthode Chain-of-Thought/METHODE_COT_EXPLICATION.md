# LA MÉTHODE Chain-of-Thought (CoT)
### Guide de Référence pour le Raisonnement Étape par Étape

## 1. Qu'est-ce que la méthode Chain-of-Thought ?

La **méthode Chain-of-Thought** (Chaîne de Pensée) est une technique de prompt engineering qui force le LLM à **décomposer son raisonnement** en étapes explicites avant de donner une réponse finale.

Son principe fondateur est le **"Show Your Work"** (Montre ton travail).
* **Règle d'or :** Ne jamais sauter directement à la conclusion.
* **Communication :** Chaque étape de raisonnement est visible et vérifiable.

---

## 2. Les Variantes de Chain-of-Thought

### 🔹 Zero-Shot CoT
Ajouter simplement "Réfléchis étape par étape" au prompt.

```
Question: Si j'ai 3 pommes et j'en achète 5, puis j'en donne 2, combien m'en reste-t-il ?

Prompt: Réfléchis étape par étape avant de répondre.
```

### 🔹 Few-Shot CoT
Fournir des exemples de raisonnement détaillé.

```
Exemple 1:
Q: 2 + 3 × 4 = ?
Raisonnement: D'abord la multiplication: 3 × 4 = 12. Puis l'addition: 2 + 12 = 14.
R: 14

Maintenant résous: 5 + 2 × 3 = ?
```

### 🔹 Auto-CoT (Automatique)
Le LLM génère ses propres exemples de raisonnement.

---

## 3. Le Workflow CoT avec Agents

```
┌──────────────────────────────────────────────────────────┐
│                                                          │
│  📥 PROBLÈME                                             │
│       │                                                  │
│       ▼                                                  │
│  🔀 DÉCOMPOSEUR ──► Découpe en sous-problèmes           │
│       │                                                  │
│       ▼                                                  │
│  🧠 RAISONNEUR ──► Résout chaque étape                  │
│       │                                                  │
│       ▼                                                  │
│  ✅ VÉRIFICATEUR ──► Valide chaque étape                │
│       │                                                  │
│       ▼                                                  │
│  📝 SYNTHÉTISEUR ──► Compile la réponse finale          │
│       │                                                  │
│       ▼                                                  │
│  📤 RÉPONSE                                              │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

### 🔹 Agent Décomposeur
* **Rôle :** Analyser le problème et le découper en sous-étapes.
* **Output :** Liste ordonnée des étapes à suivre.

### 🔹 Agent Raisonneur
* **Rôle :** Raisonner explicitement sur chaque étape.
* **Output :** Solution intermédiaire avec justification.

### 🔹 Agent Vérificateur
* **Rôle :** Valider la cohérence de chaque étape.
* **Output :** Confirmation ou correction.

### 🔹 Agent Synthétiseur
* **Rôle :** Assembler les résultats en réponse finale.
* **Output :** Réponse complète et structurée.

---

## 4. Exemple Concret

**Problème :** "Marie a 15€. Elle achète 3 croissants à 1,20€ et 2 cafés à 2,50€. Combien lui reste-t-il ?"

### Décomposition :
1. Calculer le coût des croissants
2. Calculer le coût des cafés
3. Calculer le total dépensé
4. Calculer le reste

### Raisonnement :
| Étape | Calcul | Résultat |
|-------|--------|----------|
| 1 | 3 × 1,20€ | 3,60€ |
| 2 | 2 × 2,50€ | 5,00€ |
| 3 | 3,60€ + 5,00€ | 8,60€ |
| 4 | 15€ - 8,60€ | **6,40€** |

### Vérification :
- ✅ Étape 1 : Correct (3 × 1,20 = 3,60)
- ✅ Étape 2 : Correct (2 × 2,50 = 5,00)
- ✅ Étape 3 : Correct (3,60 + 5,00 = 8,60)
- ✅ Étape 4 : Correct (15 - 8,60 = 6,40)

### Réponse finale :
Il reste **6,40€** à Marie.

---

## 5. Pourquoi utiliser CoT ? (Les Avantages)

### ✅ 1. Amélioration Drastique sur les Problèmes Complexes
Les LLMs passent de ~20% à ~80% de réussite sur les problèmes mathématiques avec CoT.

### ✅ 2. Traçabilité des Erreurs
Si la réponse est fausse, on peut identifier exactement quelle étape a échoué.

### ✅ 3. Simple à Implémenter
Ajouter "Réfléchis étape par étape" suffit souvent.

### ✅ 4. Universel
Fonctionne pour les maths, la logique, le code, l'analyse...

---

## 6. Les Inconvénients

### ❌ 1. Coût en Tokens
Les réponses sont plus longues (3-5x plus de tokens).

### ❌ 2. Latence
Temps de réponse plus long.

### ❌ 3. Pas Toujours Nécessaire
Pour les questions simples, c'est overkill.

---

## 7. Comparaison des Méthodes

| Critère | BMAD | ReAct | CoT |
|---------|------|-------|-----|
| **Focus** | Équipe projet | Agent itératif | Prompt unique |
| **Complexité** | Haute | Moyenne | Faible |
| **Usage** | Développement | Recherche/Action | Raisonnement |
| **Outils** | Non requis | Requis | Non requis |

---

## 8. Quand l'utiliser ?

Utilisez Chain-of-Thought si :
1. Le problème nécessite du **raisonnement logique**
2. Vous voulez **comprendre** le processus de décision
3. La **précision** est importante (maths, code, analyse)
4. Vous voulez une solution **simple et efficace**
