# Scalabilité, Virtualisation et Conteneurisation

## Documents

0. [Syllabus](./docs/00-syllabus.md)
1. [Conteneurs avec Docker](./docs/01-conteneurs_avec_docker.md) ([TP](./docs/01-conteneurs_avec_docker_tp.md))
2. [Mise à l'échelle avec les conteneurs](./docs/02-mise_a_l_echelle_avec_les_conteneurs.md) ([TP](./docs/02-mise_a_l_echelle_avec_les_conteneurs_tp.md))
3. [Docker CLI](./docs/03-docker_cli.md)
3. [Kubernetes](./docs/04-kubernetes.md)

<small>Note : installer l'extension [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) pour visionner les documents.</small>

## Projets

* [`app`](./projects/app/) : microservice http pour écrire et lire des données en cache
* [`cache`](./projects/cache/) : microservice de cache basé sur redis
* [`tp1`](./projects/tp1/) : scripts pour lancer des conteneurs pour les microservices `app` et `cache` avec docker
* [`tp2`](./projects/tp2/) : scripts pour lancer des conteneurs pour les microservices `app` et `cache` avec docker compose
