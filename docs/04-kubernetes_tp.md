---
marp: true
title: 04-kubernetes_tp
description: 04-kubernetes_tp
headingDivider: 2
paginate: true
theme: default
style: |
  section h3 {
    margin-bottom: 0.75em;
    font-size: 1.3em;
  }
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

# TP - Kubernetes

<!-- header: Scalabilité, Virtualisation et Conteneurisation -->
<!-- _class: dark -->
<!-- _paginate: false -->

## Partie 1 : Installer Kubernetes en local

<!-- _class: enum -->

* Installer un cluster Kubernetes local avec [Docker Desktop](https://docs.docker.com/desktop/kubernetes/), ou [minikube](https://kubernetes.io/docs/tutorials/hello-minikube/), ou [kind](https://kind.sigs.k8s.io/)
* [Installer `kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl) si nécessaire
  * Docker Desktop [fournit la commande `kubectl`](https://docs.docker.com/desktop/kubernetes/#enable-kubernetes)
  * `minikube kubectl -- <kubectl commands>` est une [version embarquée](https://minikube.sigs.k8s.io/docs/handbook/kubectl/)
  * `kind` [n'embarque pas `kubectl`](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
* Installer NGINX Ingress Controller ([pour `kubernetes`](https://github.com/kubernetes/ingress-nginx/blob/main/README.md#readme), [`minikube`](https://minikube.sigs.k8s.io/docs/tutorials/nginx_tcp_udp_ingress/), [`kind`](https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx), [...](https://kubernetes.github.io/ingress-nginx/deploy/))
* Installer et configurer l'accès au [Kubernetes Dashboard](https://kubernetes.io/fr/docs/tasks/access-application-cluster/web-ui-dashboard/) si nécessaire ([`minikube` intègre le Dashboard](https://minikube.sigs.k8s.io/docs/handbook/dashboard/))
* Lancer un [Docker Registry](https://hub.docker.com/_/registry) en local

## Partie 2 : Déployer avec Kubernetes en local

<!-- _class: enum -->

* Concevoir un manifest Kubernetes pour déployer votre API et Redis
* Si nécessaire, modifier l'implémentation de votre API pour permettre son exécution avec Kubernetes
* Si  besoin, écrire des scripts pour les différentes tâches utiles (lancer build/test/dev le déploiement sur plusieurs environnements comme hprod et prod, ...)
* Rédiger une documentation complète à la racine du dépôt (`README.md`) expliquant les prérequis, présentant les composants de l'application, l'organisation de votre code, le rôle des composants, les instructions pour développer/tester les composants sans Docker/Kubernetes + avec Docker + avec Kubernetes, les instructions de build et de déploiement, et/ou toute information utile

