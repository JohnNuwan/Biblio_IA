# 🧬 05. AgentZero & The Next Gen : La Convergence LLM + RL

## 1. L'Ère Post-Librarie
**AgentZero** n'est pas juste un framework, c'est un manifeste.
Créé pour montrer qu'un agent peut être **auto-évolutif**.
Il est "Zero" car il commence sans outils pré-codés (ou presque). Il écrit ses propres outils en Python, les teste, et apprend de ses erreurs.

### Cycle de Vie d'AgentZero
1.  **Code Generation** : Le LLM écrit un script pour résoudre la tâche.
2.  **Execution & Trace** : Le script tourne dans un Docker. On capture stdout/stderr.
3.  **Self-Correction** : Si erreur, le LLM lit la stacktrace et réécrit le code.
4.  **Memorization** : Si succès, le code est stocké dans une mémoire vectorielle ("Ceci est la fonction pour scanner le web").

---

## 2. Search-on-Thought (ToT + RL)

La prochaine étape après le "Prompting" est la "Recherche" (Search).
Au lieu de générer un seul token, l'IA génère un **Arbre de Pensées** (Tree of Thoughts).

### L'Algorithme Q* (Q-Star) Hypothétique
L'idée est d'appliquer **A* (A-Star)** ou **MCTS** sur les pensées du LLM.
*   État : Le texte actuel.
*   Action : La prochaine phrase.
*   Value Function $Q(s, a)$ : Est-ce que cette phrase nous rapproche de la solution ?

Ceci permet à un LLM de "revenir en arrière" (Backtrack) s'il s'aperçoit qu'il a dit une bêtise, chose impossible avec un Transformer standard (Autoregressif "Left-to-Right").

---

## 3. Le Futur : System 1 (Intuition) + System 2 (Raisonnement)

*   **System 1 (LLM actuel)** : Réponse rapide, heuristique, parfois fausse. (Comme parler sans réfléchir).
*   **System 2 (AgentZero / MuZero)** : Réponse lente, simulée, vérifiée. (Comme résoudre une équation).

L'avenir n'est pas "Plus de paramètres". L'avenir est **"Plus de Compute au moment de l'inférence"** (Test-Time Compute).
Laisser l'agent "réfléchir" (simuler 1000 chemins) pendant 30 secondes avant de donner la réponse parfaite.

> "Training Compute is finite. Inference Compute is infinite."
