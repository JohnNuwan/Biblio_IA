# 🗣️ Conversation Design : Les Bonnes Pratiques

## 🌍 Contexte & Enjeux
L'expérience utilisateur (UX) conversationnelle est fondamentalement différente de l'UX graphique. Un utilisateur ne "clique" pas, il dialogue. Si le design de la conversation est mauvais (réponses trop longues, impasses, ton robotique), l'utilisateur abandonne immédiatement. L'enjeu du "Conversation Design" (CxD) est de structurer l'imprévisible : anticiper les digressions humaines tout en guidant l'utilisateur vers son but, créant ainsi une illusion de fluidité et d'intelligence.

Créer un chatbot ou un Voicebot n'est pas un problème de code, c'est un problème de **design**.
Le "Conversation Design" (CxD) est l'art de rendre les interactions avec l'IA naturelles et efficaces.

---

## 1. Le Principe de Coopération (Grice's Maxims)

Pour qu'une IA soit "humaine", elle doit respecter les 4 maximes de Paul Grice :
1.  **Quantité** : Ne parlez pas trop (ni trop peu). Soyez concis.
    *   *Mauvais* : "Bonjour, je suis le bot de la banque, je peux vous aider avec vos comptes, vos prêts, vos cartes..." (Trop long)
    *   *Bon* : "Bonjour, comment puis-je vous aider ?"
2.  **Qualité** : Ne dites que ce qui est vrai (pas d'hallucinations).
3.  **Relation** : Soyez pertinent par rapport au contexte précédent.
4.  **Manière** : Soyez clair et évitez le jargon technique ("Erreur 404" -> "Je n'ai pas trouvé l'info").

---

## 2. La Gestion des Erreurs (Repair Strategies)

Une conversation IA échoue souvent. Comment "réparer" sans frustrer ?

### A. Le "No Match" (Je n'ai pas compris)
*   *Niveau 1* : "Pardon, je n'ai pas compris."
*   *Niveau 2 (Rapid Reprompt)* : "Désolé, voulez-vous parler à un agent ou consulter votre solde ?" (Proposez des options).
*   *Niveau 3 (Escalade)* : "Je vois que j'ai du mal à vous aider. Je vous passe un humain."

### B. Le Context Switching
L'utilisateur change de sujet en plein milieu.
*   *User* : "Je veux réserver un billet pour Paris... Ah non, quel temps il fait à Lyon ?"
*   *Bot* : Doit répondre sur la météo, puis demander : "Voulez-vous toujours réserver pour Paris ?" (Memory retention).

---

## 3. Le Persona Design

Une IA sans personnalité est ennuyeuse et "creepy". Définissez :
*   **Nom** : Julie ? Bot-X ?
*   **Rôle** : Assistant serviable ? Expert technique froid ? Coach motivant ?
*   **Ton** : Formel vs Informel. Emojis ou pas ?

> **Règle d'Or** : Ne prétendez jamais être humain. "Je suis votre assistant virtuel" instaure la confiance.

---

## 4. One-Breath Test (Pour la Voix)

Pour les Voicebots : Lisez la réponse de votre bot à voix haute.
Si vous devez reprendre votre respiration au milieu de la phrase, **c'est trop long**.
*   *Chat* : L'œil peut scanner un paragraphe.
*   *Voix* : L'oreille ne peut pas "revenir en arrière". Phrases courtes obligatoires.

---

## 🏢 Ils l'utilisent déjà

*   **Google** : A publié "Conversation Design Guidelines", la bible du secteur, utilisée pour Google Assistant.
*   **Duolingo** : Maître du "Persona". Duo (le hibou) est passif-agressif pour vous motiver, créant un lien émotionnel fort qui booste la rétention.
*   **Apple** : A une équipe dédiée d'écrivains (dramaturges, scénaristes) à Hollywood juste pour écrire les blagues de Siri et maintenir sa personnalité constante.

## Conclusion

Le Conversation Designer est le nouvel architecte de l'interface utilisateur. Son outil n'est pas Figma, mais le **Scénario** et le **Prompt**.
