---
marp: true
title: episen_sca_seance_1
description: episen_sca_seance_1
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

# Séance 1 - Conteneurs avec Docker

---

<!-- _class: toc -->
<!-- _paginate: false -->

## Sommaire

1. Virtualisation
2. Conteneurisation
3. Docker


---

<!-- _paginate: false -->

# <!-- fit --> 1. Virtualisation

---

<!-- _class: enum -->
<!-- _header: 1. Virtualisation -->

## Qu'est-ce que la virtualisation ? 💡

* Technologie utilisée pour **créer des représentations virtuelles** de serveurs, de stockage, de réseaux et d'autres machines physiques
* **Imiter le fonctionnement de matériel physique** pour exécuter plusieurs machines virtuelles sur une seule machine physique
* Permettre une **utilisation plus efficace des ressources matérielles**
* Base du cloud computing « Infrastructure en tant que service » (IaaS)

---

<!-- _class: figure -->
<!-- _header: 1. Virtualisation -->

## Comparaison de l'architecture traditionnelle et de l'architecture virtualisée

![w:24em](./assets/seance_1/comparison_of_traditional_architecture_and_virtualized_architecture.png)

Implementation and evaluation of a container management platform on Docker: Hadoop deployment as an example - Scientific Figure on ResearchGate. Available from: https://www.researchgate.net/figure/Comparison-of-traditional-architecture-and-virtualized-architecture_fig1_352545350

---

<!-- _class: enum -->
<!-- _header: 1. Virtualisation -->

## Quels avantages de la virtualisation ? 👍

* **Utilisation efficace des ressources matérielles** permettant d'économiser sur le matériel par mutualisation (réduction des coûts : achat, hébergement, maintenance, ...)
* **Gestion informatique automatisée** permettant d'éviter les configurations manuelles sujettes aux erreurs
* **Reprise plus rapide après sinistre** permettant d'améliorer considérablement la résilience et facilite la continuité des activités

---

<!-- _class: enum -->
<!-- _header: 1. Virtualisation -->

## Quels inconvénients de la virtualisation ? 👎

* **Performance dégradée** par la couche d'abstraction matérielle (l'exécution d'un logiciel virtualisé consommera davantage de ressources qu'en mode natif)
* Sans redondance, la panne d'une machine hôte impacte l'ensemble des machines virtuelles hébergées
* **Investissement initial** car la mise en oeuvre est complexe
* Possibles **contraintes administratives** (déploiement, sauvegarde, ...)

---

<!-- _paginate: false -->

# <!-- fit --> 2. Conteneurisation

---

<!-- _class: enum -->
<!-- _header: 2. Conteneurisation -->

## Qu'est-ce que la conteneurisation ? 💡

* Technologie utilisée pour **créer des instances d'espace utilisateur isolées**
* **Un conteneur est une enveloppe virtuelle** (sources, environnement d'exécution, librairies, outils et fichiers) assemblée en un ensemble cohérent et prêt à être déployé
* Un programme d'un conteneur est **limité à son contenu et aux périphériques associés** (isolation du processus applicatif du reste du système)
* S'appuie sur le noyau du système d'exploitation sur lequel il est déployé (de l'hôte)

---

<!-- _class: figure -->
<!-- _header: 2. Conteneurisation -->

## Comparaison entre les conteneurs et les machines virtuelles

![w:26em](./assets/seance_1/machine_virtuelle_vs_conteneur.png)

Découvrez les conteneurs - Optimisez votre déploiement en créant des conteneurs avec Docker - OpenClassrooms : https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs

---

<!-- _class: enum -->
<!-- _header: 2. Conteneurisation -->

## Quels avantages de la conteneurisation ? 👍

* **Agilité** ~ Raccourcir les cycles de publication et travailler rapidement sur les mises à jour avec le modèle de conteneur
* **Capacité de mise à l’échelle** ~ Ajouter facilement plusieurs conteneurs pour réaliser de la scalabilité horizontale
* **Légèreté** ~ Exploiter le noyau du système hôte offre une performance supérieure à la virtualisation
* **Portabilité** ~ Déployer une application dans plusieurs environnements sans réécrire le code du programme
* **Tolérance aux pannes** ~ Créer plusieurs conteneurs augmente la résilience et la disponibilité de l'application

---

<!-- _class: enum -->
<!-- _header: 2. Conteneurisation -->

## Quels inconvénients de la conteneurisation ? 👎

* Pas adapté pour les applications qui nécessitent une interface graphique
* Difficulté à gérer une grande quantité de conteneurs
* Pas de compatibilité multiplateforme (une application conçue pour s'exécuter dans un conteneur sur Windows, ne peut pas s'exécuter dans un conteneur sur Linux)
* Ne fournit pas de solution pour la sauvegarde et la récupération de données

---

<!-- _paginate: false -->

# <!-- fit --> 3. Docker

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

![bg right 85%](./assets/seance_1/docker_devops_illustration.png)

## Docker

* Créé dans les années 2010 par [Solomon Hykes](https://fr.wikipedia.org/wiki/Solomon_Hykes) (_dotCloud_)
* Plateforme permettant de **lancer des applications dans des conteneurs logiciels**
* Distribué en tant que projet open source à partir de mars 2013

---

<!-- _class: figure -->
<!-- _header: 3. Docker -->

## Docker Architecture

![w:32em](./assets/seance_1/docker_architecture.svg)

Docker overview | Docker Documentation : https://docs.docker.com/get-started/overview/

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

![bg right 95%](./assets/seance_1/docker_engine.png)

## Docker Engine

* **docker daemon** (dockerd) : processus long chargé de la création et de la gestion des conteneurs
* **REST API** : API REST définissant un ensemble d’interfaces pour interagir avec dockerd
* **docker CLI** : Interface en ligne de commande pour interagir avec dockerd

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

![bg right 75%](./assets/seance_1/docker_registry_illustration.png)

## Docker Registry

* Un registre Docker **stocke des images Docker**
* [Docker Hub](https://hub.docker.com/) est un registre public configuré par défaut
* Solutions de registres privés : [Container registry](https://cloud.google.com/container-registry/), [Artifactory](https://www.jfrog.com/confluence/display/RTF/Getting+Started+with+Artifactory+as+a+Docker+Registry), ...
* `docker pull` ou `docker run` récupère une image depuis le registre configuré
* `docker push` publie l'image sur le registre configuré

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

![bg right 98%](./assets/seance_1/docker_image_example.png)

## Docker Image

* Toute image Docker repose sur une image source (Ubuntu, CentOS, Debian, Alpine)
* Une image contient _n_ instructions permettant sa construction
* Elle possède un nom, une version et un tag (par défaut « latest »)

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

## Pourquoi adopter Docker ?

* Accélérer le développement d’une application métier
* Intégration simple dans les chaînes d'intégration et de déploiement continues ([Gitlab CI/CD](https://docs.gitlab.com/ee/ci/), [Bitbucket](http://bitbuck.com/), [CircleCI](https://circleci.com/), ...)
* Un conteneur est de part sa nature « portable », capacité à s’exécuter une machine locale, serveur physique ou virtuel, cloud
* La taille réduite d’un conteneur et le fait qu’il soit « stateless » permet une montée en charge horizontale simplifiée en un temps très court

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

![bg right 90%](./assets/seance_1/docker_cest_vraiment_securise.png)

## <!-- fit --> Qu’en est-il de la sécurité ?

* Un conteneur (et ses privilèges) est un processus classique
* Attention à ne pas exécuter les processus sous l’utilisateur « root »
* Être vigilant sur les images sources utilisées
<!--
* Une bonne partie du sous-système du kernel Linux ne possèdes pas encore d’espace de noms (SELinux, /sys, /proc)
-->

---

<!-- _class: enum -->
<!-- _header: 3. Docker -->

![bg right 90%](./assets/seance_1/on_fait_du_docker_boss.png)

## <!-- fit --> Quelles sont les limitations ?

* Comment orchestrer des dizaines, centaines de conteneurs uniques à la base ?
* Compliqué d’avoir un service type « cron », « syslog » au sein d’un conteneur Docker
* Le démon Docker nécessitant des droits « root », ce qui le rend sensible aux attaques

---

<!-- _class: dark references -->
<!-- _paginate: false -->

## Références

* AWS - Qu’est-ce que la conteneurisation ?<br>https://aws.amazon.com/fr/what-is/containerization/
* AWS - Qu'est-ce que la virtualisation ?<br>https://aws.amazon.com/fr/what-is/virtualization/
* Docker - Docker documentation<br>https://docs.docker.com
* Wikipédia - Conteneur (informatique)<br>https://fr.wikipedia.org/wiki/Conteneur_(informatique)
* Wikipédia - Conteneur (virtualisation)<br>https://fr.wikipedia.org/wiki/Conteneur_(virtualisation)
* Wikipédia - Virtualisation<br>https://fr.wikipedia.org/wiki/Virtualisation
