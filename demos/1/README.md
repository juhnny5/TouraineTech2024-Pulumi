## Démo 1 : Créer sa première instance OpenStack 😇

```bash
# Pour bien commencer
source ../../.env
source $HOME/.keystonerc
pulumi stack init demo # Commande déjà appliquée

# Ne pas stocker le state localement mais dans un Bucket type S3
pulumi login 's3://plstate-openstack-demo1?endpoint=${VM_IP}:9000&disableSSL=true&s3ForcePathStyle=true'

# Voir les modification à apporter
pulumi preview --non-interactive

# Appliquer les modifications à apporter
pulumi update --non-interactive --yes

# Détruire les modifications apportées
pulumi destroy --non-interactive --yes
```
