## Démo 3 : Créer des ressources en apportant une couche d’abstraction (avec Python)

### Les commandes

```bash
# Pour bien commencer
source ../../.env
source $HOME/.keystonerc
pulumi stack init demo # Commande déjà appliquée

# Ne pas stocker le state localement mais dans un Bucket type S3
pulumi login "s3://plstate-openstack-demo3?endpoint=${VM_IP}:9000&disableSSL=true&s3ForcePathStyle=true"

# Voir les modification à apporter
pulumi preview --non-interactive

# Appliquer les modifications à apporter
pulumi update --non-interactive --yes

# Vérifier que l'instance est créée
source $HOME/.keystonerc # Si nouveau shell ouvert
openstack server list
watch -n2 'openstack server list'

# Détruire les modifications apportées
pulumi destroy --non-interactive --yes
```
