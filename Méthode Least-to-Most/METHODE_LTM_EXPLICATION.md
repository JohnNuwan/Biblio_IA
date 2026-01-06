# LA MÉTHODE Least-to-Most
### Guide de Référence pour la Décomposition Progressive

## 1. Qu'est-ce que la méthode Least-to-Most ?

La **méthode Least-to-Most** (Du moins au plus) résout les problèmes en commençant par les **sous-problèmes les plus simples**, puis utilise ces résultats pour résoudre les plus complexes.

Son principe fondateur est le **"Divide and Conquer"** (Diviser pour régner).
* **Règle d'or :** Résoudre du plus simple au plus complexe.
* **Communication :** Chaque solution alimente la suivante.

---

## 2. Le Workflow Least-to-Most

```
📥 PROBLÈME COMPLEXE
     │
     ▼
🔀 DÉCOMPOSEUR ──► Identifie sous-problèmes
     │
     ├──► Sous-prob 1 (simple) ──► Solution 1
     │                                  │
     ├──► Sous-prob 2 (moyen) ◄─────────┘
     │         │
     │         ▼
     │    Solution 2
     │         │
     └──► Sous-prob 3 (complexe) ◄──────┘
               │
               ▼
          📤 SOLUTION FINALE
```

---

## 3. Les Agents Least-to-Most

### 🔹 Agent Décomposeur
* **Rôle :** Diviser en sous-problèmes ordonnés.
* **Output :** Liste de sous-problèmes du plus simple au plus complexe.

### 🔹 Agent Résolveur Progressif
* **Rôle :** Résoudre chaque sous-problème en utilisant les précédents.
* **Output :** Solutions progressives.

---

## 4. Exemple

**Problème :** "Combien de mots uniques dans : 'le chat mange le poisson'"

### Décomposition :
1. *(Simple)* Lister tous les mots
2. *(Moyen)* Identifier les répétitions
3. *(Complexe)* Compter les mots uniques

### Résolution progressive :

**Sous-prob 1 :** Mots = [le, chat, mange, le, poisson] → 5 mots

**Sous-prob 2 :** "le" apparaît 2 fois → 1 répétition

**Sous-prob 3 :** 5 - 1 = 4 mots uniques → {le, chat, mange, poisson}

**Réponse :** 4 mots uniques

---

## 5. Quand l'utiliser ?

- Problèmes décomposables hiérarchiquement
- Questions de généralisation
- Tâches de comptage/analyse
