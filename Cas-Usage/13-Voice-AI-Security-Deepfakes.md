# 🛡️ Fighting Voice AI Spam & Deepfakes

## 🌍 Contexte & Enjeux
La capacité d'imiter une voix humaine avec 3 secondes d'audio (Zero-Shot Cloning) a ouvert la boîte de Pandore.
D'un côté, le phishing vocal ("Vishing") devient indétectable : un PDG reçoit un appel de son "Directeur Financier" demandant un virement urgent.
De l'autre, le spam téléphonique automatisé peut inonder les réseaux de millions d'appels par heure.
L'enjeu est la **Confiance**. Si on ne peut plus croire ses oreilles, comment faire société ? Des mécanismes d'authentification (Watermarking) et de défense sont urgents.

---

## La Menace : L'Attaque des Clones

Les arnaques classiques ("Grandparent Scam" : "Mamy, j'ai eu un accident, envoie de l'argent") sont dopées aux stéroïdes. L'escroc utilise la voix réelle du petit-fils récupérée sur TikTok.
C'est une course aux armements entre les **Générateurs** (ElevenLabs, OpenAI) et les **Détecteurs**.

### Les Solutions Techniques
1.  **Audio Watermarking** : Insérer un signal inaudible (frequence ou pattern) dans l'audio généré par IA. (Google SynthID).
2.  **Challenge-Response** : Si vous avez un doute, posez une question dont seul le vrai interlocuteur a la réponse ("Quel est le nom de notre premier chien ?"). Les bots échouent au contexte personnel.
3.  **Analyse Spectrale** : L'IA laisse des artefacts infimes (respiration trop régulière, manque de micro-variations de pitch) que des algos de défense peuvent repérer.

---

## 🏢 Ils l'utilisent déjà

*   **Pindrop** : Leader mondial de l'analyse vocale pour les banques. Ils détectent les deepfakes en analysant la signature acoustique de l'appel (bruit de fond, codec, source synthétique).
*   **FTC (Federal Trade Commission)** : A lancé le "Voice Cloning Challenge" pour primer les technologies capables de bloquer ces appels.
*   **ElevenLabs** : A intégré un "AI Speech Classifier" pour permettre à n'importe qui de vérifier si un fichier audio a été généré par leur plateforme.

## Conclusion
La voix était notre "bio-métrie" naturelle. Ce n'est plus le cas.
À l'avenir, les appels sensibles se feront probablement via des canaux authentifiés cryptographiquement, et non plus via le réseau téléphonique commuté (PSTN) vulnérable.
