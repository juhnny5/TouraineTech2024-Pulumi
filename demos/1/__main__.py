import pulumi
import pulumi_openstack as openstack

# Créer une nouvelle instance
instance = openstack.compute.Instance("demo-instance",
    flavor_name="m1.small",
    image_name="Ubuntu Server 22.04",
    key_pair="jbriault",
    security_groups=["secgroup01"],
    networks=[{"name": "tenant_network"}],
)

# Création de l'adresse IP flottante
floating_ip = openstack.networking.FloatingIp("demo-floating-ip",
    pool="external_network"
)

# Association de l'adresse IP flottante à l'instance
floating_ip_association = openstack.compute.FloatingIpAssociate("demo-floating-ip-association",
    floating_ip=floating_ip.address,
    instance_id=instance.id
)

# Exporter les adresses IP (pour débogage)
pulumi.export("instance_floating_ip", instance.floating_ip)
pulumi.export("instance_internal_ip", instance.access_ip_v4)
