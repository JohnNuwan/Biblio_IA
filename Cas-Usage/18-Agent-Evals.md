# 🧪 Beyond Vibe Checks: Measuring Whether Your Agent Really Works with Evals

## 🌍 Contexte & Enjeux
"J'ai testé 3 questions, ça a l'air de marcher." -> C'est le **Vibe Check**.
Le problème : quand vous changez le prompt pour corriger un bug, vous en créez souvent deux autres invisibles (Régression).
L'enjeu industriel est de passer du "Vibe Check" manuel aux **Evals Automatisées** (Unit Tests pour LLM). Sans Evals, vous ne pouvez pas optimiser ou changer de modèle en confiance.

---

## 3 Niveaux de "LLM Evaluation"

1.  **Metric-Based (Rouge/BLEU)** :
    *   Compare les mots exacts.
    *   *Limite* : Si l'IA dit "Joyeux" au lieu de "Heureux", le score chute alors que le sens est bon.

2.  **Model-Based Evaluation (LLM-as-a-Judge)** :
    *   Utiliser GPT-4 pour noter la réponse de GPT-3.5.
    *   *Prompt* : "Note la pertinence de cette réponse sur 10 par rapport à la question".
    *   C'est le standard actuel.

3.  **Human Feedback (RLHF)** :
    *   Le "Gold Standard". Des humains notent A vs B. Lent et cher, mais indispensable pour calibrer le "Juge IA" (voir point 2).

---

## 🏢 Ils l'utilisent déjà

*   **OpenAI** : Utilise une armée de "Evals" internes. Chaque nouvelle version de GPT-4 doit passer des milliers de tests (Maths, Coding, Safety) avant d'être relâchée.
*   **LangSmith (LangChain)** : Plateforme qui permet aux devs de créer des datasets de test ("Golden Datasets") et de lancer des régressions à chaque commit.
*   **Discord** : Pour leur Clyde AI, ils mesurent non seulement la réponse, mais la "Latence Perçue" et le taux d'abandon, corrélant la qualité technique au business.

## Conclusion
"If you can't measure it, you can't improve it."
Tant que vous n'avez pas d'Evals, vous ne faites pas de l'ingénierie, vous faites de l'alchimie.
