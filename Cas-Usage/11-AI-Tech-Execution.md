# 🛠️ AI in Tech : Beyond Expectations, Into Execution

## 🌍 Contexte & Enjeux
2023 était l'année de la "Wow Phase" (Démos, POCs, Hype). 2024-2025 est l'année de l'**Exécution**. Les entreprises sont fatiguées des "Chatbots PDF" qui marchent une fois sur deux. L'enjeu n'est plus "Regardez ce que l'IA peut faire" mais "Comment intégrer ça dans mon produit legacy sans tout casser ?". Le défi technique passe du Prompt Engineering à l'**AI Engineering** (Fiabilité, Monitoring, Coûts, Latence).

---

## Sortir de "l'Enfer du POC"

Beaucoup de projets IA meurent au stade du POC (Proof of Concept). Pourquoi ?
1.  **Le coût caché** : Une démo avec GPT-4 coûte 0.10$. Le passer sur 1M d'utilisateurs coûte 100k$/mois. -> *Solution : Modèles SLM (Small Language Models) ou mise en cache.*
2.  **La latence** : 5 secondes pour répondre, c'est marrant en démo, inutilisable en prod. -> *Solution : Streaming, UI Optimiste.*
3.  **La non-déterminisme** : Le Boss n'aime pas quand l'IA répond deux choses différentes à la même question. -> *Solution : Température 0, Seeds, Tests d'évaluation (Evals).*

---

## L'Ère de l'AI Engineering
On ne cherche plus des "Data Scientists" qui font des modèles théoriques, mais des "AI Engineers" qui savent :
*   Gérer des **Rate Limits**.
*   Mettre en place des **Guardrails** (Sécurité).
*   Orchestrer des chaînes RAG complexes (Retries, Fallbacks).

---

## 🏢 Ils l'utilisent déjà

*   **Notion** : A réussi l'exécution parfaite avec "Notion AI". Ce n'est pas un chatbot à côté, c'est intégré *dans* l'éditeur (résumer, traduire, étendre) avec une UX fluide.
*   **Intercom** : A pivoté tout son produit autour de "Fin", leur agent de support, en acceptant de cannibaliser leur ancien business model (facturation au siège -> facturation à la résolution).
*   **Adobe** : Avec Firefly, ils ont résolu le problème de "Copyright" (Execution) qui bloquait les pros, en entraînant l'IA uniquement sur leur banque d'images Adobe Stock.

## Conclusion
L'exécution, c'est les 99% de travail invisible qui rendent la magie fiable. L'IA qui gagne n'est pas la plus intelligente, c'est celle qui marche le plus souvent.
