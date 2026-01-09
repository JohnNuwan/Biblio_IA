# 04 - Transformers & Mécanisme d'Attention : Le Moteur de la Révolution

![Transformer Architecture](..\assets\images\transformer-attention.png)

Si vous devez comprendre UNE seule architecture en IA, c'est celle-ci.
Avant 2017, les IA lisaient le texte mot à mot (RNN). Depuis l'article *"Attention is All You Need"* (Google), elles comprennent le contexte global instantanément. C'est la naissance des LLM modernes.

---

## 1. Le Problème des Anciens Modèles (RNN/LSTM)

Imaginez que vous lisiez une phrase à travers un petit trou, mot après mot.
> "La **banque** a refusé le prêt car elle..."

Arrivé à "elle", le modèle doit se souvenir de "banque" vu 10 mots plus tôt. Les RNN (Réseaux de Neurones Récurrents) avaient une "mémoire courte". Ils oubliaient le début de la phrase à la fin du paragraphe.

## 2. La Révolution : "Self-Attention"

Le mécanisme d'Attention permet au modèle de regarder **tous les mots de la phrase en même temps** et de calculer des liens de pertinence entre eux.

C'est comme surligner des mots connectés :
> "L'**animal** n'a pas traversé la **rue** car **il** était trop **fatigué**."

L'IA calcule un score d'attention :
*   À quoi se réfère "**il**" ? -> 80% "**animal**", 10% "**rue**".
*   Pourquoi "**fatigué**" ? -> Connecté à "**animal**".

### La Métaphore : Query, Key, Value
Le papier de 2017 utilise une analogie de base de données :
*   **Query (Q)** : Ce que je cherche (ex: le mot actuel).
*   **Key (K)** : L'étiquette des autres mots.
*   **Value (V)** : Le contenu réel des mots.

$$ Attention(Q, K, V) = softmax(\frac{QK^T}{\sqrt{d_k}})V $$

*(Ne fuyez pas ! Ça veut juste dire : "Trouve les mots les plus proches (QK), normalise les scores (softmax), et mélange leurs sens (V)".)*

---

## 3. L'Architecture Transformer

Un Transformer n'est qu'un empilement de blocs d'attention.

### Encoder vs Decoder
*   **Encoder (BERT)** : Lit le texte et comprend le sens. Parfait pour la classification ou l'analyse de sentiment.
*   **Decoder (GPT)** : Génère le prochain mot. Parfait pour écrire du texte.
*   **Encoder-Decoder (T5, Bart)** : Lit et écrit. Parfait pour la traduction.

> **Notez bien :** GPT (Generative Pre-trained Transformer) n'utilise que la partie "Décodeur".

---

## 4. Pourquoi c'est puissant ?

1.  **Parallélisation** : Contrairement aux RNN qui sont séquentiels (mot 1, puis mot 2...), les Transformers traitent tout le texte d'un coup. On peut donc utiliser des milliers de GPU en parallèle.
2.  **Contexte Long** : On peut (théoriquement) faire attention à des millions de mots. C'est ce qui permet à Gemini 1.5 Pro d'avoir une fenêtre de 2 millions de tokens.
3.  **Transfer Learning** : On peut pré-entraîner un modèle sur tout Internet pour qu'il comprenne la langue, puis le "Fine-Tuner" sur une tâche précise.

---

## Résumé pour l'Expert

Si on vous demande "C'est quoi un LLM ?", vous répondez :
> "C'est un modèle probabiliste basé sur l'architecture Transformer, qui utilise le mécanisme de Self-Attention pour prédire le prochain token (morceau de mot) en fonction d'un contexte vaste."
