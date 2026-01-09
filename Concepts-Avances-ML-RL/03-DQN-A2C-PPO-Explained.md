# 🤖 03. DQN, A2C, PPO : Les Algorithmes qui ont changé l'IA

## 1. Introduction : Model-Free vs Model-Based

Ici on parle de **Model-Free RL**. L'agent ne connaît pas les règles du jeu (il ne sait pas que la gravité fait tomber la pomme). Il apprend juste en regardant les pixels.

---

## 2. Deep Q-Network (DQN) - 2013 (DeepMind)

C'est l'algo qui a permis à l'IA de jouer à Atari.

### Le Problème du Q-Learning Tabulaire
Dans un jeu simple, on stocke $Q(s,a)$ dans un tableau Excel géant.
Mais une image Atari a $256^{210 \times 160}$ états. Tableau impossible.

### L'Approche Deep
On remplace le tableau par un **Réseau de Neurones** $Q_\theta(s, a)$.
Le réseau prend les pixels en entrée et sort la valeur de chaque action.

### L'Innovation : Experience Replay
Le RL est instable car les données sont corrélées (l'image à $t$ ressemble à $t+1$).
DQN stocke les transitions $(s, a, r, s')$ dans un "Buffer" et pioche dedans au hasard.
$$ L_i(\theta_i) = \mathbb{E} [(r + \gamma \max_{a'} Q(s', a'; \theta_{i-1}) - Q(s, a; \theta_i))^2] $$
*(On minimise la différence entre notre prédiction et la cible Bellman).*

---

## 3. Actor-Critic (A2C/A3C)

Séparer le cerveau en deux :
1.  **Actor** $\pi_\theta(s)$ : Décide quelle action prendre (Le Joueur).
2.  **Critic** $V_w(s)$ : Juge si l'état est bon (Le Coach).

Le Critic calcule l'**Advantage** $A(s,a)$ : "Est-ce que cette action était mieux que la moyenne ?"
$$ A(s, a) = Q(s, a) - V(s) $$
L'Actor apprend dans la direction du gradient seulement si $A(s, a) > 0$.

---

## 4. Proximal Policy Optimization (PPO) - 2017 (OpenAI)

C'est l'algorithme "State of the Art" par défaut. Il a servi à entraîner **GPT-3 via RLHF**.

### Le Problème
En RL, si on change trop brutalement les poids du réseau, l'agent "tombe de la falaise" (Policy Collapse) et ne retrouve jamais le chemin.

### La Solution : Clipped Objective
PPO force la mise à jour à rester dans une petite zone de confiance ("Trust Region").
On compare la nouvelle politique $\pi$ et l'ancienne $\pi_{old}$ via un ratio $r(\theta)$.
Si $r(\theta)$ s'éloigne trop de 1 (ex: > 1.2), on coupe le gradient (Clip).

$$ L^{CLIP}(\theta) = \mathbb{E} [ \min(r_t(\theta) \hat{A}_t, \text{clip}(r_t(\theta), 1-\epsilon, 1+\epsilon) \hat{A}_t) ] $$

*   $\hat{A}_t$ : Avantage (Est-ce que l'action était bonne ?)
*   $\epsilon$ : Hyperparamètre (souvent 0.2). On empêche le modèle de changer de plus de 20% à la fois.

### Impact sur ChatGPT
PPO est stable et facile à tuner. C'est pourquoi OpenAI l'a choisi pour aligner GPT :
1.  GPT génère une phrase.
2.  Reward Model (entraîné par humains) donne un score.
3.  PPO met à jour GPT pour maximiser ce score sans détruire ses capacités linguistiques (grâce au Clip).
