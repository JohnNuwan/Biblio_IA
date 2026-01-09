# 🔮 04. World Models : MuZero & Dreamer (Model-Based RL)

## 1. La Limite du Model-Free
DQN et PPO apprennent par essai-erreur. Il leur faut des milliards de frames pour apprendre.
Un humain apprend vite car il a un **Modèle du Monde** dans sa tête ("Si je lâche ce verre, il va tomber"). Il peut **planifier**.

Le **Model-Based RL** cherche à apprendre ce modèle : $s_{t+1} = f(s_t, a_t)$.

---

## 2. MuZero (2019) : Apprendre sans décoder les pixels

AlphaGo connaissait les règles du Go. MuZero ne les connaît pas.
L'astuce géniale de MuZero : Il ne prédit pas les pixels futurs (trop dur), il prédit l'état futur dans un **Espace Latent** (Caché).

### Les 3 Fonctions Clés
1.  **Representation** $h(o)$ : Transforme l'observation (pixels) en état caché $s^0$.
2.  **Dynamics** $g(s, a)$ : Prédit l'état futur $s^{k+1}$ et la récompense $r^k$. (C'est le simulateur mental).
3.  **Prediction** $f(s)$ : Prédit la politique $\pi$ et la valeur $v$.

### Monte Carlo Tree Search (MCTS)
MuZero utilise son "Simulateur Mental" (Dynamics) pour explorer des futurs possibles dans sa tête *avant* de jouer. C'est le **System 2** (Réflexion) appliqué au RL.

---

## 3. DreamerV3 (2023) : Mastering Diverse Domains

Dreamer pousse le concept encore plus loin. L'agent apprend entièrement dans son rêve (World Model) et n'interagit avec le monde réel que pour collecter des données.

### L'Architecture
*   **World Model** : Apprend à prédire le futur (Sequence Modeling).
*   **Actor-Critic** : S'entraîne sur les trajectoires imaginées par le World Model.

### La Révolution "Symlog"
Le problème du RL est l'échelle des récompenses. (Pong = +1, Mario = +1000).
DreamerV3 introduit la transformation $symlog(x) = sign(x) \ln(|x| + 1)$.
Cela écrase les différences d'échelle. L'agent peut apprendre à jouer à Minecraft (+ diamants) et au Go (+1 victoire) avec les **mêmes hyperparamètres**.

---

## 4. Pourquoi c'est le futur ? (Jepta, Sora)

Les modèles génératifs vidéo (Sora) sont des World Models. Ils comprennent la physique.
La convergence est là :
*   **GenAI** : Apprend $P(Video)$. (Regarder le monde).
*   **Model-Based RL** : Apprend $P(Video | Action)$. (Agir sur le monde).

Le prochain "GPT-5" sera probablement un agent Model-Based capable de planifier dans un espace latent avant de répondre.
