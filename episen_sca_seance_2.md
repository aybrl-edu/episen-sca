---
marp: true
title: episen_sca_seance_2
description: episen_sca_seance_2
paginate: true
theme: default
style: |
  section.dark {
    background: #123;
  }
  section.dark header {
    color: #fff;
    font-size: 1em
  }
  section.dark h1,
  section.dark h2,
  section.dark h3,
  section.dark h4,
  section.dark h5,
  section.dark h6,
  section.dark p,
  section.dark ul {
    color: #fff
  }
  section.figure p {
    text-align: center;
  }
  section.figure p:last-child {
    font-size: 0.5em;
    font-style: italic;
  }
  section.references ul {
    list-style-type: none;
    padding-left: 0;
  }
  section.toc h2 {
    font-size: 1.6em;
    color: #123;
  }
  section.toc ol {
    font-size: 1.3em;
    font-weight: bold;
    line-height: 2.2em;
    padding-left: 1.2em;
  }
  section.enum > ul {
    list-style-type: none;
    padding: 0;
  }
  section.enum > ul > li {
    margin-bottom: 0.5em;
  }
  section.enum > ul > li:last-child {
    margin-bottom: 0;
  }
  section.enum > ul > li::before {
    content: '➡️';
    display: inline-block;
    margin-right: 0.1875em;
  }
  section.enum > h3 + ul {
    margin-top: 0.5em;
  }
---

<!-- _class: dark -->
<!-- _header: Scalabilité, Virtualisation et Conteneurisation -->
<!-- _paginate: false -->

# Séance 2 - Mise à l'échelle avec les conteneurs

---

<!-- _class: toc -->
<!-- _paginate: false -->

## Sommaire

1. Mise à l'échelle avec les conteneurs
2. Docker Compose
3. Optimisation des ressources allouées aux conteneurs

---

<!-- _paginate: false -->

# <!-- fit --> 1. Mise à l'échelle avec les conteneurs

---

<!-- _class: enum -->
<!-- _header: 1. Mise à l'échelle avec les conteneurs -->

## La mise à l’échelle est-elle complexe ?

* Maîtriser le périmètre métier de l'application
* Calculer les ressources nécessaires à l’exécution de l'application
* L’applicatif est-il _stateless_ ou _statefull_ ?
* La mise à l’echelle est-elle _manuelle_ ou _automatique_ ?
* Qui opère cette mise à l’échelle ?
* Qu’est-ce qui justifie une mise à l’échelle d’un composant ?

---

<!-- _class: enum -->
<!-- _header: 1. Mise à l'échelle avec les conteneurs -->

## Mise à l’échelle manuelle de conteneurs

![bg right 85%](./assets/seance_2/je_lance_n_fois_docker_run.png)

* Tâche répétitive
* Action manuelle
* Sujette aux erreurs humaines
* Inadaptée pour un grand nombre de conteneurs à démarrer dans un laps de temps réduit

---

<!-- _class: enum -->
<!-- _header: 1. Mise à l'échelle avec les conteneurs -->

## Mise à l'échelle automatique de conteneurs

![bg right 85%](./assets/seance_2/et_si_on_utilisait_un_orchestrateur.png)

* [Docker Compose](https://docs.docker.com/compose/) pour **exécuter des applications multi-conteneurs**
* Approche déclarative basée sur du code donc traçable dans le temps
* Utilisable pour l’ensemble des composants d'une application
* Réplication gérée par [Compose](https://docs.docker.com/compose/)

---

<!-- _class: enum -->
<!-- _header: 1. Mise à l'échelle avec les conteneurs -->

## Mise à l'échelle automatique de conteneurs

![bg right 85%](./assets/seance_2/si_jetais_vous_jutiliserais_un_ordchestrateur.png)

* Traçabilité des actions
* Approche déclarative
* Scalabilité réalisée par l’orchestrateur
* Automatisation des processus
* Nécessite une montée en compétences des équipes devops
* Déploiement des conteneurs sur des multiples hosts possible

---

<!-- _class: enum -->
<!-- _header: 1. Mise à l'échelle avec les conteneurs -->

## Mauvaises pratiques pour la mise à l'échelle

* Négliger le dimensionnement de l’infrastructure du cluster de l’orchestrateur (Swarm, k8s)
* Mauvaise définition des rôles et responsabilités devops
* Ne pas connaître les besoins systèmes des composants applicatifs
* Omettre la maintenance du cluster et ses versions

---

<!-- _paginate: false -->

# <!-- fit --> 2. Docker Compose

---

<!-- _class: enum -->
<!-- _header: 2. Docker Compose -->

## Introduction

![bg right 75%](./assets/seance_2/octopus.png)

* Outil faisant partie de l’écosystème Docker
* Définition, exécution de conteneurs dans N environnements isolés sur un nœud
* Fichier de description se basant sur un langage standard: YAML

---

<!-- _class: enum -->
<!-- _header: 2. Docker Compose -->

## Cas d’utilisations

### Environnement de développement simplifié

* Guide d’un nouvel arrivant simplifié
* Simuler un environnement isolé de bout-en-bout (application, database, cache)
* Gain de temps et de productivité pour l’équipe de développement

### Environnement de test automatisé

* Exécution simplifié des tests end-to-end
* Mise en place d’une stack technique sur demande pour l’exécution des tests

### Déploiement

* 1 nœud local et/ou distant
* 1 cluster Swarm

<style scoped>
h3 { margin: 0; }
</style>

---

<!-- _header: 2. Docker Compose -->

## Exemple de Docker Compose

```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - ".:/code"
      - "logvolume:/var/log"
    links:
      - redis
  redis:
    image: redis:latest
volumes:
  logvolume: {}
```

---

<!-- _paginate: false -->

# <!-- fit --> 3. Pourquoi faut-il optimiser les ressources alloués aux conteneurs

---

<!-- _class: enum -->
<!-- _header: 3. Pourquoi faut-il optimiser les ressources alloués aux conteneurs -->

## Contexte

* Un conteneur peut avoir besoin de : Stockage, CPU, RAM
* Une fuite mémoire dans l’application s’exécutant dans le conteneur
* Une attaque extérieur provoquant un accroissement des ressources systèmes
* Mauvaise configuration des ressources systèmes pour un conteneur X

---

<!-- _class: enum -->
<!-- _header: 3. Pourquoi faut-il optimiser les ressources alloués aux conteneurs -->

## Les risques du mode « no-limit »

### Out of Memory Exception

* Arrêt de processus « important » par le kernel Unix
* Indisponibilité de l’application en Production
* Instabilité de la plateforme de Production

### Accès illimité aux cycles CPUs d’une machine hôte (virtuelle, physique)

* Instabilité de la machine hôte
* Effets de bords sur les autres conteneurs hébergés sur la machine hôte

---

<!-- _class: enum -->
<!-- _header: 3. Pourquoi faut-il optimiser les ressources alloués aux conteneurs -->

## Bonnes pratiques

* Connaître les besoins en mémoire de son application via des phases de tests
* Limiter les ressources mémoire nécessaire au bon fonctionnement de l’application
* Ajuster la configuration de la SWAP sur les hôtes Docker
* Définir des limites sur les accès aux cycles CPUs de la machine hôte

---

<!-- _class: dark references -->
<!-- _paginate: false -->

## Références

* Docker<br>https://docs.docker.com
* Docker Compose<br>https://docs.docker.com/compose
* GitHub - docker/compose<br>https://github.com/docker/compose
* The Twelve-Factor App<br>https://12factor.net