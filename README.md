# Pulumi : Gérer son infra avec son langage de programmation préféré 😎

![](img/tnt_logo.jpg)

## Avant propos 😇

### Lancer l'environnement de démonstration

L'environnement de démonstration repose sur l'utilisation de Multipass, OpenStack et MinIO. MinIO est installé dans une machine virtuelle créée au préalable par Multipass.

> ⚠️ Cloud-Init n'est pas utilisé lors du setup de la VM à cause du problème de NAT qui impose un redémarrage de la VM avant de pouvoir accéder au réseau sur macOS M1 (non-intel).

Pour l'ancer la création de l'environnement :

```bash
./setup_env.sh
multipass shell minio
sudo bash install_minio.sh
```

## Ce dépôt 🙏

Ce dépôt et découpé de la manière suivante :

```bash
demos/
    1/ # Code de la démo 1 - Créer sa première instance OpenStack
    2/ # Code de la démo 2 - Comparer avec du code Terraform
    3/ # Code de la démo 3 - Créer des ressources en apportant une couche d’abstraction (avec Python)
    4/ # Code de la démo 4 - Créer des ressources YAML (natif)
    backup/ # Replay des démos (en cas d'effet démo)
img/ # Images utilisées dans le repo
lib/ # Scripts utilisés pour setup l'environnement de démo (avec MinIO)
slides/ # Les slides du talk
```
