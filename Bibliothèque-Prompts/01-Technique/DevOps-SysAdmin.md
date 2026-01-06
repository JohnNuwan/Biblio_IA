# 🔧 Prompts DevOps & SysAdmin

## 1. Pipeline CI/CD

```
Crée un pipeline CI/CD pour ce projet.

**Stack :** [Technologies]
**Outil CI/CD :** [GitHub Actions / GitLab CI / Jenkins / ...]
**Environnements :** [Dev / Staging / Prod]

Inclus :
1. Build et tests
2. Analyse de code (lint, security)
3. Build Docker (si applicable)
4. Déploiement par environnement
5. Rollback strategy
6. Notifications
```

---

## 2. Dockerfile

```
Crée un Dockerfile optimisé pour : [APPLICATION]

**Langage/Framework :** [STACK]
**Besoins :**
- Taille minimale
- Multi-stage build
- Non-root user
- Health check

Explique chaque instruction.
```

---

## 3. Infrastructure as Code

```
Génère le code Terraform/Ansible pour : [INFRASTRUCTURE]

**Cloud :** [AWS / Azure / GCP]
**Ressources :**
- [Ressource 1]
- [Ressource 2]

**Contraintes :** [Sécurité, coût, région]

Inclus les bonnes pratiques (modules, variables, outputs).
```

---

## 4. Monitoring & Alerting

```
Configure le monitoring pour : [SYSTÈME/APPLICATION]

**Stack monitoring :** [Prometheus/Grafana / Datadog / CloudWatch]

Définis :
1. Métriques clés à collecter
2. Dashboards (structure)
3. Alertes (seuils, destinataires)
4. Runbooks associés
```

---

## 5. Incident Response

```
Crée un runbook pour l'incident : [TYPE D'INCIDENT]

**Système concerné :** [NOM]
**Criticité :** [P1/P2/P3]

Structure :
1. Symptômes
2. Impact
3. Diagnostic rapide
4. Actions de remédiation
5. Escalade
6. Communication
7. Post-incident
```

---

## 6. Kubernetes

```
Génère les manifests Kubernetes pour : [APPLICATION]

**Type :** [Deployment / StatefulSet / ...]
**Besoins :**
- Replicas : [N]
- Resources : [CPU, Mem]
- Probes
- ConfigMap / Secrets

Inclus : Deployment, Service, Ingress, HPA si nécessaire.
```

---

## 7. Script d'Automatisation

```
Écris un script [Bash/PowerShell/Python] pour : [TÂCHE]

**Environnement :** [Linux/Windows]
**Fréquence :** [Manuel/Cron/...]

Le script doit :
- Gérer les erreurs
- Logger les actions
- Être idempotent si possible
- Avoir des paramètres configurables
```

---

## 8. Documentation Infra

```
Documente cette infrastructure.

**Composants :**
[LISTE OU SCHÉMA]

Structure :
1. Vue d'ensemble (schéma ASCII)
2. Composants et rôles
3. Flux de données
4. Dépendances
5. Accès et credentials (où les trouver)
6. Procédures de maintenance
```
