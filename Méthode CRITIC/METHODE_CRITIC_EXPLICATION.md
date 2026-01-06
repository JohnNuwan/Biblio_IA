# LA MÉTHODE CRITIC
### Guide de Référence pour l'Auto-Critique

## 1. Qu'est-ce que la méthode CRITIC ?

La **méthode CRITIC** (Self-Correcting with Tool-Interactive Critiquing) permet à un LLM de **critiquer et corriger ses propres réponses** en utilisant des outils externes pour vérification.

Son principe fondateur est le **"Trust but Verify"** (Faire confiance mais vérifier).
* **Règle d'or :** Toujours remettre en question sa première réponse.
* **Communication :** Cycle Réponse → Critique → Correction.

---

## 2. Le Workflow CRITIC

```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│  📥 QUESTION                                               │
│       │                                                    │
│       ▼                                                    │
│  💬 RÉPONDEUR ──► Première réponse                        │
│       │                                                    │
│       ▼                                                    │
│  🔍 CRITIQUE ──► Analyse critique + outils                │
│       │                                                    │
│       ├──── OK ───► ✅ RÉPONSE FINALE                     │
│       │                                                    │
│       └──── Erreur ───► 🔧 CORRECTEUR                     │
│                              │                             │
│                              ▼                             │
│                         💬 Réponse corrigée               │
│                              │                             │
│                   ┌──────────┘                             │
│                   ▼                                        │
│              🔍 CRITIQUE (re-vérification)                │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## 3. Les Agents CRITIC

### 🔹 Agent Répondeur
* **Rôle :** Générer une première réponse.
* **Output :** Réponse initiale (potentiellement incorrecte).

### 🔹 Agent Critique
* **Rôle :** Analyser la réponse et identifier les erreurs.
* **Outils :** Recherche web, calcul, vérification de faits.
* **Output :** Liste des problèmes détectés.

### 🔹 Agent Correcteur
* **Rôle :** Corriger les erreurs identifiées.
* **Output :** Réponse améliorée.

### 🔹 Agent Validateur
* **Rôle :** Confirmer que la correction est satisfaisante.
* **Output :** Approbation ou demande de nouvelle itération.

---

## 4. Types de Critiques

### 🔹 Critique Factuelle
Vérifier les faits avec des sources externes.
```
"Paris est la capitale de l'Allemagne"
→ Critique : Faux, Paris est la capitale de la France
```

### 🔹 Critique Logique
Vérifier la cohérence du raisonnement.
```
"Si A > B et B > C, alors C > A"
→ Critique : Erreur logique, devrait être A > C
```

### 🔹 Critique Calculatoire
Refaire les calculs.
```
"15 × 7 = 115"
→ Critique : Erreur, 15 × 7 = 105
```

### 🔹 Critique Stylistique
Vérifier le ton, la clarté, le format.

---

## 5. Exemple Concret

**Question :** "Qui a écrit 'Les Misérables' et en quelle année ?"

### Réponse initiale :
> Les Misérables a été écrit par Victor Hugo en 1852.

### Critique :
```
🔍 Vérification avec recherche web...
Résultat : Les Misérables a été publié en 1862, pas 1852.

Erreurs détectées :
- ❌ Année incorrecte : 1852 → devrait être 1862
- ✅ Auteur correct : Victor Hugo
```

### Correction :
> Les Misérables a été écrit par Victor Hugo et publié en **1862**.

### Validation :
✅ Réponse validée - Tous les faits sont corrects.

---

## 6. Pourquoi utiliser CRITIC ? (Les Avantages)

### ✅ 1. Réduction des Hallucinations
Les erreurs factuelles sont détectées et corrigées.

### ✅ 2. Vérification Externe
Utilisation d'outils pour confirmer les faits.

### ✅ 3. Auto-Amélioration
Le modèle apprend de ses erreurs dans la même session.

### ✅ 4. Transparence
Le processus de correction est visible.

---

## 7. Les Inconvénients

### ❌ 1. Dépendance aux Outils
Nécessite des APIs externes (recherche, calcul...).

### ❌ 2. Latence
Plusieurs étapes = temps de réponse plus long.

### ❌ 3. Coût
Appels d'outils + plusieurs générations.

### ❌ 4. Sur-correction
Risque de "corriger" des réponses correctes.

---

## 8. Quand l'utiliser ?

Utilisez CRITIC si :
1. La **précision factuelle** est critique
2. Vous avez accès à des **outils de vérification**
3. Les **erreurs** ont des conséquences importantes
4. Vous voulez une **traçabilité** des corrections
