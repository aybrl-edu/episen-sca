---
marp: true
title: episen_sca_seance_2_tp
description: episen_sca_seance_2_tp
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

# TP 2 - Mise à l'échelle avec les conteneurs

---

<!-- _class: enum -->

## TP: Mise à l’échelle avec les conteneurs avec Docker Compose

* Ajouter des labels dans l’image API créée lors de la séance 1
* Concevoir le Docker Compose adapté à vos images API et Redis
* Intégrer la gestion des ressources alloués aux 2 services
* Modifier le code applicatif en incluant les changements liés à l’intégration de Docker Compose
* Stimuler les deux services avec Postman et  observer la consommation des ressources  systèmes avec et sans optimisation des  ressources alloués aux conteneurs
