# 🧠 01. De ML à Transformers : L'Évolution Mathématique de la "Cognition"

## 1. Machine Learning vs Deep Learning : Le "Feature Engineering"

La différence fondamentale réside dans la représentation de la donnée.

### Machine Learning Classique (SVM, Random Forest)
L'humain doit extraire les caractéristiques (features) manuellement.
*   **Input** : Image de chat.
*   **Features Manual** : `a_des_oreilles_pointues=1`, `couleur=roux`.
*   **Model** : $y = w \cdot x + b$ (Le modèle pèse les features).

### Deep Learning (Réseaux de Neurones)
Le réseau apprend ses propres features (Representation Learning).
Les premières couches apprennent les bords, les suivantes les formes, les dernières les objets.

---

## 2. Le Neurone Artificiel (Perceptron)

L'unité de base imitant le neurone biologique.

### Formule Mathématique
$$ z = \sum (w_i \cdot x_i) + b $$
$$ a = \sigma(z) $$

*   $x_i$ : Inputs (données).
*   $w_i$ : Poids (Force de la connexion synaptique).
*   $b$ : Biais (Seuil d'activation).
*   $\sigma$ : Fonction d'activation (ReLU, Sigmoid, Tanh). C'est elle qui introduit la **non-linéarité**. Sans $\sigma$, un réseau profond n'est qu'une régression linéaire géante.

### Backpropagation (Rétropropagation du Gradient)
C'est l'algorithme qui permet d'apprendre. On calcule l'erreur à la fin et on remonte pour corriger les poids.
$$ \frac{\partial L}{\partial w} = \frac{\partial L}{\partial a} \cdot \frac{\partial a}{\partial z} \cdot \frac{\partial z}{\partial w} $$
*(Règle de la chaîne)*

---

## 3. L'Impasse des RNN & LSTM (1990-2015)

Pour traiter du texte (séquence), on utilisait des **Recurrent Neural Networks (RNN)**.
Le neurone $t$ prend en entrée le mot $x_t$ ET l'état caché du neurone précédent $h_{t-1}$.

### Le Problème : Vanishing Gradient
Sur une longue phrase, le gradient tend vers 0 lors de la rétropropagation. Le début de la phrase est oublié.
$$ |W| < 1 \implies W^{100} \approx 0 $$

### La Solution Partielle : LSTM (Long Short-Term Memory)
Introduction de "Portes" (Gates) physiques pour laisser passer l'information.
*   Input Gate : Quoi Stocker ?
*   Forget Gate : Quoi oublier ?
*   Output Gate : Quoi dire ?

**Inconvénient Majeur** : C'est séquentiel. On ne peut pas calculer le mot 10 tant qu'on n'a pas calculé le mot 9. **Impossible de paralléliser sur GPU.**

---

## 4. La Révolution Transformer (2017) : "Attention is All You Need"

Google Brain choque le monde en supprimant la récurrence. Plus de $t-1$. Tout est calculé en parallèle.

### Mécanisme de Self-Attention (L'équation clé)
L'attention permet à chaque mot de "regarder" tous les autres mots de la phrase pour comprendre le contexte.

$$ Attention(Q, K, V) = softmax(\frac{QK^T}{\sqrt{d_k}})V $$

*   **Q (Query)** : Ce que je cherche (ex: le pronom "Il").
*   **K (Key)** : L'étiquette des autres mots (ex: "Sujet", "Verbe").
*   **V (Value)** : Le contenu des mots.

Si $Q$ ("Il") matche avec $K$ ("Jean"), le score est élevé, et on récupère beaucoup de $V$ ("Jean"). Le pronom "Il" absorbe le sens de "Jean".

```mermaid
graph TD
    Input[Input: "Jean mange la pomme"] --> Embedding
    Embedding --> PositionalEncoding[Positional Encoding]
    PositionalEncoding --> MultiHeadAttention
    MultiHeadAttention --> AddNorm1[Add & Norm]
    AddNorm1 --> FeedForward[Feed Forward Network]
    FeedForward --> AddNorm2[Add & Norm]
    AddNorm2 --> Output
    
    subgraph Attention Mechanism
    Q[Query]
    K[Key]
    V[Value]
    MatMul[MatMul Q*K] --> Scale
    Scale --> Softmax
    Softmax --> MatMul2[MatMul * V]
    end
```

### Pourquoi c'est une révolution ?
1.  **Parallélisation Infinie** : On peut entraîner sur 10.000 GPUs en même temps.
2.  **Contexte Global** : Chaque mot "voit" toute la phrase instantanément, pas de perte de mémoire à long terme.

C'est cette architecture qui a permis GPT-1, 2, 3, 4.
Nous sommes passés d'une approche **Séquentielle (Lente, Amnésique)** à une approche **Attentionnelle (Rapide, Omnisciente)**.
