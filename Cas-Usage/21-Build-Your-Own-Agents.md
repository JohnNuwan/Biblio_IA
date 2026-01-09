# 🤖 Build Your Own Agents: A Simple Baseline That’s Hard to Beat

## 🌍 Contexte & Enjeux
La complexité des frameworks d'agents (LangChain, AutoGPT) a explosé. Les développeurs se noient dans les abstractions ("Chains", "Graphs", "Memory Stores").
Pourtant, une vérité émerge des benchmarks : **un simple script Python de 50 lignes avec une boucle `while` est souvent plus fiable et debuggable.**
L'enjeu est de retrouver la maîtrise du code. "Start Simple, Add Complexity only when broken."

---

## Le "Golden Loop" (La Base Imbattable)

Au lieu d'importer une librairie lourde, voici le pattern qui bat 80% des agents :
1.  **System Prompt Solide** : "Tu es un assistant qui a accès aux outils X, Y."
2.  **API Call** : Envoyer l'historique au LLM.
3.  **Tool Execution** : Si le LLM demande un outil, l'exécuter en Python pur.
4.  **Loop** : Renvoyer le résultat au LLM.

### Pourquoi ça gagne ?
*   **Débuggabilité** : Pas de "Magic Box". Vous voyez exactement quel prompt part chez OpenAI.
*   **Flexibilité** : Vous gérez les erreurs (Rate Limits, Timeouts) comme vous voulez, pas comme le framework l'a décidé.

---

## 🏢 Ils l'utilisent déjà

*   **Anthropic** : Leur documentation recommande explicitement de construire des agents "de gré à gré" (from scratch) pour comprendre le flux avant d'utiliser des abstractions.
*   **Replit Agent** : Construit sur une architecture sur-mesure très simple (Plan -> Act -> Observe) sans framework tiers lourd, pour une latence minimale.
*   **Karpathy (ex-OpenAI)** : A souvent plaidé pour "LLM.c" ou des approches minimalistes. "Le code est le meilleur prompt."

## Conclusion
N'utilisez pas un bazooka (Framework Complexe) pour tuer une mouche (tâche simple).
Commencez par `import openai`, et construisez votre propre boucle. Vous serez surpris de la puissance de la simplicité.
