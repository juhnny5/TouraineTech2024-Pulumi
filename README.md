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

blabla
