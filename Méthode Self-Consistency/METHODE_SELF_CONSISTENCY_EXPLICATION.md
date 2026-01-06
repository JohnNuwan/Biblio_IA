# LA MÉTHODE Self-Consistency
### Guide de Référence pour le Vote Multi-Réponses

## 1. Qu'est-ce que la méthode Self-Consistency ?

La **méthode Self-Consistency** (Auto-Cohérence) améliore la fiabilité des réponses en **générant plusieurs solutions indépendantes** puis en votant pour la plus fréquente.

Son principe fondateur est le **"Wisdom of Crowds"** (Sagesse des foules).
* **Règle d'or :** Si plusieurs raisonnements arrivent à la même conclusion, elle est probablement correcte.
* **Communication :** La réponse finale est celle qui apparaît le plus souvent.

---

## 2. Le Workflow Self-Consistency

```
                        📥 PROBLÈME
                             │
              ┌──────────────┼──────────────┐
              ▼              ▼              ▼
         🧠 Chemin 1    🧠 Chemin 2    🧠 Chemin 3
         (CoT indép.)   (CoT indép.)   (CoT indép.)
              │              │              │
              ▼              ▼              ▼
         📝 Réponse A   📝 Réponse A   📝 Réponse B
              │              │              │
              └──────────────┼──────────────┘
                             ▼
                    🗳️ AGRÉGATEUR (Vote)
                             │
                             ▼
                    📤 RÉPONSE A (2 votes)
```

---

## 3. Les Agents Self-Consistency

### 🔹 Agent Échantillonneur
* **Rôle :** Générer plusieurs raisonnements indépendants.
* **Output :** N chemins de pensée avec leurs conclusions.

### 🔹 Agent Agrégateur
* **Rôle :** Compter les votes et déterminer la réponse majoritaire.
* **Output :** Réponse finale avec score de confiance.

### 🔹 Agent Analyseur (optionnel)
* **Rôle :** Analyser les divergences entre les réponses.
* **Output :** Explication des différences.

---

## 4. Exemple Concret

**Problème :** "Un fermier a 17 moutons. Tous sauf 9 meurent. Combien en reste-t-il ?"

### Échantillonnage (5 chemins) :

| Chemin | Raisonnement | Réponse |
|--------|--------------|---------|
| 1 | "Tous sauf 9" signifie que 9 survivent → **9** | 9 |
| 2 | 17 - 9 = 8 moutons survivent → **8** | 8 |
| 3 | "Tous sauf 9 meurent" = 9 restent → **9** | 9 |
| 4 | Si 9 meurent, 17-9 = **8** restent | 8 |
| 5 | "Sauf 9" = ces 9 là ne meurent pas → **9** | 9 |

### Agrégation :

| Réponse | Votes | Pourcentage |
|---------|-------|-------------|
| **9** | 3 | 60% |
| 8 | 2 | 40% |

### Réponse finale : **9 moutons** (confiance: 60%)

---

## 5. Stratégies de Vote

### 🔹 Vote Majoritaire Simple
La réponse avec le plus de votes gagne.

### 🔹 Vote Pondéré
Pondérer par la qualité du raisonnement.

### 🔹 Seuil de Confiance
Rejeter si aucune réponse n'atteint X% des votes.

---

## 6. Pourquoi utiliser Self-Consistency ? (Les Avantages)

### ✅ 1. Amélioration de la Précision
+10-20% de précision sur les benchmarks mathématiques.

### ✅ 2. Détection d'Incertitude
Si les votes sont dispersés, le modèle est incertain.

### ✅ 3. Simple à Implémenter
Juste générer plusieurs fois et compter.

### ✅ 4. Combine avec CoT
Fonctionne très bien avec Chain-of-Thought.

---

## 7. Les Inconvénients

### ❌ 1. Coût Multiplié
N appels au lieu de 1 (typiquement N=5 à 10).

### ❌ 2. Latence
Attendre toutes les réponses avant de voter.

### ❌ 3. Biais Systémique
Si le modèle a un biais, il sera amplifié.

---

## 8. Quand l'utiliser ?

Utilisez Self-Consistency si :
1. La **précision** est critique
2. Vous avez le **budget** pour plusieurs appels
3. La tâche a une **réponse objective** (maths, logique)
4. Vous voulez **mesurer l'incertitude**
