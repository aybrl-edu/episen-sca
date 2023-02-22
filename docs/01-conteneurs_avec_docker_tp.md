---
marp: true
title: episen_sca_seance_1_tp
description: episen_sca_seance_1_tp
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

---

<!-- _class: dark -->
<!-- _header: Scalabilité, Virtualisation et Conteneurisation -->
<!-- _paginate: false -->

# TP 1 - Conteneurs avec Docker

---

<!-- _class: enum -->

# Partie 1

## Développement

* Implémenter une API exposant 2 endpoints (Create, Read) dans le langage de votre choix ([Java](https://www.java.com/en/), [NodeJS](https://nodejs.org/), [Python](https://www.python.org/), etc).

## Conteneurisation

* Concevoir un [Dockerfile](https://docs.docker.com/engine/reference/builder/) adapté à votre API précédemment implémentée.
* Construire puis tagger l’image [Docker](https://docs.docker.com/) en locale sur votre poste de développement.
* Exécuter un conteneur se basant sur votre image et tester votre API en locale.

---

<!-- _class: enum -->

# Partie 2

## Conteneurisation

* Récupérer et exécuter l’image officielle [Redis](https://redis.io/) du registre [Docker Hub](https://hub.docker.com/_/redis).

## Développement

* Modifier l’implémentation de votre API pour insérer et lire des données dans [Redis](https://redis.io/).

---

<!-- _class: enum -->

# Partie 3

## Conteneurisation

* Construire une nouvelle version de votre image applicative intégrant la lecture et écriture dans [Redis](https://redis.io/).
* Exécuter un conteneur à partir de la nouvelle image applicative et tester l'interopérabilité entre votre API et [Redis](https://redis.io/).
