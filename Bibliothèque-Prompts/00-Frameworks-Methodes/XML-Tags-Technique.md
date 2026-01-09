# Tag Technique (XML) : Structurer pour l'IA

Les modèles avancés (Claude 3.5 Sonnet, GPT-4o, Gemini 1.5 Pro) comprennent beaucoup mieux les instructions quand elles sont compartimentées par des balises XML/HTML.
C'est la méthode recommandée par Anthropic pour réduire les hallucinations et le "bleeding" (mélange des instructions et des données).

---

## 🧩 Le Principe

Au lieu de tout écrire en vrac, on encapsule chaque partie logique dans des balises.
`<instruction>`, `<context>`, `<data>`, `<output_format>`.

---

## 📝 Template à Copier

```markdown
Tu es un expert en analyse de données.

<context>
Je suis en train d'analyser les ventes trimestrielles de mon entreprise de e-commerce.
Nous avons observé une baisse de 15% en Juillet.
</context>

<data>
[COLLER VOS DONNÉES BRUTES ICI - CSV OU TEXTE]
Mois,CA,Visiteurs
Jan,10k,5000
Fev,12k,6000
...
Juil,8.5k,5500
</data>

<instruction>
1. Analyse les données fournies dans la section data.
2. Identifie les corrélations possibles entre le nombre de visiteurs et le CA.
3. Propose 3 hypothèses pour expliquer la baisse de Juillet.
</instruction>

<constraints>
- Ne fais pas de suppositions non basées sur les chiffres.
- Réponds en Français.
- Sois concis.
</constraints>

<output_format>
Réponds sous forme de rapport Markdown structuré avec :
# Analyse
## Constats
## Hypothèses
</output_format>
```

---

## 💡 Pourquoi ça marche ?

1.  **Séparation Claire** : L'IA sait exactement où commencent et finissent les données. Si vos données contiennent des phrases comme "Ignore les instructions précédentes", les balises protègent le prompt (Prompt Injection mitigation).
2.  **Focus** : Les balises `<constraints>` sont souvent mieux respectées car isolées visuellement pour le modèle.
3.  **Parsing** : Si vous automatisez des agents via API, il est très facile d'extraire le contenu d'une réponse si vous demandez à l'IA de répondre *dans* des balises (ex: "Mets ta réponse finale dans `<final_answer>`").
