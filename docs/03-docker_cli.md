---
marp: true
title: 01-conteneurs_avec_docker
description: 01-conteneurs_avec_docker
headingDivider: 2
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
    line-height: 1.4em;
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

# Séance 3 - Docker CLI

<!-- header: Scalabilité, Virtualisation et Conteneurisation -->
<!-- _class: dark -->
<!-- _paginate: false -->

## Sommaire

<!-- header: Séance 3 - Docker CLI -->
<!-- _class: toc -->
<!-- _paginate: false -->

1. [Docker deamon](#1-docker-deamon)
2. [Commandes générales](#2-commandes-générales)
3. [Images](#3-images)
4. [Docker Hub](#4-docker-hub)
5. [Networks](#5-networks)
6. [Volumes](#6-volumes)
7. [Containers](#7-containers)
8. [Compose](#8-compose)

## 1. Docker deamon

### Démarrer dockerd avec les utilitaires du système d'exploitation

```sh
sudo systemctl start docker
```

### Démarrer dockerd manuellement

```sh
dockerd
```

### Démarrer dockerd sur Windows

Lancer l'exécutable `Docker Desktop.exe` pour démarrer dockerd.

## 2. Commandes générales

### Afficher l'aide générale de Docker CLI

```sh
docker [command] --help
```

### Afficher les informations systèmes de Docker (Client et Server)

```sh
docker info
docker version
```

### Se connecter au registre d'images

```sh
docker login [server] --username <username> [--password <password>]
```

## 3. Images

### Construire une image

```sh
docker build --tag <image_name> [--file path/Dockerfile] <path>
```

### Lister les images locales

```sh
docker images
```

### Supprimer une image

```sh
docker rmi <image_name>
```

## 3. Images (2)

### Taguer une image

```sh
docker tag <image_name> <new_image_name>[:image_version]
```

### Sauvegarder et charger une image depuis un .tar

```sh
docker save --output <file> <image_name>
docker load --input <file>
```

### Supprimer les images inutilisées

```sh
docker image prune [--all]
```

## 4. Docker Hub

### Rechercher une image

```sh
docker search <image_name>
```

### Récupérer une image

```sh
docker pull <image_name>[:image_version]
```

### Publier une image

```sh
docker image push <image_name>[:image_version]
```

## 5. Networks

### Créer un réseau

```sh
docker network create [options] <network_name>
```

### Lister les réseaux

```sh
docker network ls
```

### Supprimer un réseau

```sh
docker network rm <network_name> [network_name...]
```

## 5. Networks (2)

### Connecter un conteneur à un réseau

```sh
docker network connect [options] <network_name> <container>
```

### Déconnecter un conteneur à un réseau

```sh
docker network disconnect [options] <network_name> <container>
```

### Supprimer les réseaux inutilisés

```sh
docker network prune [--force]
```

## 6. Volumes

### Créer un volume

```sh
docker volume create [options] <volume_name>
```

### Lister les volumes

```sh
docker volume ls
```

### Supprimer un volume

```sh
docker volume rm <volume_name> [volume_name...]
```

### Supprimer les volumes inutilisés

```sh
docker volume prune [--force]
```

## 7. Containers

### Démarrer un nouveau conteneur

```sh
docker run [--detach] [--rm] [--name <container_name>] [--network <network>] <image_name>
```

### Démarrer et arrêter un conteneur

```sh
docker start <container>
docker stop <container>
```

### Exécuter une commande dans un conteneur

```sh
docker exec --interactive --tty <container> <command> [arg...]
```

## 7. Containers (2)

### Lister les conteneurs

```sh
docker ps [--all]
```

### Supprimer un conteneur

```sh
docker rm <container>
```

### Supprimer tous les conteneurs arrêtés

```sh
docker container prune [--force]
```

## 7. Containers (3)

### Afficher les logs d'un conteneur

```sh
docker logs [options] <container>
```

### Attacher les flux standards

```sh
docker attach [options] <container>
```

### Copier un fichier _d'un conteneur vers l'hôte_ et de _l'hôte vers un conteneur_

```sh
docker cp <container>:<source> <target>
docker cp <target> <container>:<source>
```

## 8. Compose

### Lister tous les projets Compose en cours d'exécution

```sh
docker compose ls
```

### Créer+démmarer et stopper+supprimer un projet Compose

```sh
docker compose up [options] [service...]
docker compose down [options]
```

### Lister les conteneurs d'un projet Compose

```sh
docker compose ps
```

## 8. Compose (2)

### Afficher les processus en cours d'exécution d'un projet Compose

```sh
docker compose top [service...]
```

### Démarrer/arrêter des services d'un projet Compose

```sh
docker compose start [service...]
docker compose stop [service...]
```

### Mettre en pause/reprendre l'exécution de services d'un projet Compose

```sh
docker compose pause [service...]
docker compose unpause [service...]
```


## Cheatsheet for Docker CLI

<!-- _class: figure -->
<!-- _header: "" -->
<!-- _paginate: false -->

[![](./images/03-docker_cli/dockercheatsheet.png)](./images/03-docker_cli/dockercheatsheet.png)

Source : https://github.com/sangam14/dockercheatsheets/blob/master/dockercheatsheet8.png

## Références

<!-- header: "" -->
<!-- _class: dark references -->
<!-- _paginate: false -->

* Docker CLI Cheat Sheet<br>https://docs.docker.com/get-started/docker_cheatsheet.pdf
* Docker CLI reference<br>https://docs.docker.com/engine/reference/commandline/docker/
* Docker Compose CLI reference<br>https://docs.docker.com/engine/reference/commandline/compose/#child-commands
* The Ultimate Docker Cheat Sheet<br>https://dockerlabs.collabnix.com/docker/cheatsheet/
