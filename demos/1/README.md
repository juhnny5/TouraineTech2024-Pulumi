## Démo 1 : Créer sa première instance OpenStack 😇

### Les commandes

From scratch :

```bash
# Pour bien commencer
source ../../.env
source $HOME/.keystonerc
pulumi stack init demo # Commande déjà appliquée

# Ne pas stocker le state localement mais dans un Bucket type S3
pulumi login "s3://plstate-openstack-demo1?endpoint=${VM_IP}:9000&disableSSL=true&s3ForcePathStyle=true"

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

Via script :

```bash
./demo.sh
```

### Valider la démo

Se rendre sur [http://test-pub.pulumi.demo](http://test-pub.pulumi.demo).
