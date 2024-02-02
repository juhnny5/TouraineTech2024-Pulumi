import pulumi
import pulumi_openstack as openstack

# Nom de la zone DNS à créer
domain_name = "pulumi.demo."

# Créer une zone DNS
zone = openstack.dns.Zone("pulumi.demo",
    name=domain_name,
    description="Zone de démonstration",
    email="admin@pulumi.demo",
    ttl=3000,
    type="PRIMARY"
)

# Script cloud-init
cloud_init_script = """
#cloud-config

# Upgrade system
package_update: true
package_upgrade: true

# Install packages
packages:
  - nginx
  - net-tools

runcmd:
  - echo "<h1>Coucou TouraineTech 2024</h1>" > /var/www/html/index.nginx-debian.html
  - echo "<iframe src="https://giphy.com/embed/m0MfjLtKOgTPG" width="480" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/m0MfjLtKOgTPG">via GIPHY</a></p>" >> /var/www/html/index.nginx-debian.html
  - systemctl restart nginx
"""

# Créer une nouvelle instance
instance = openstack.compute.Instance("demo-instance",
    flavor_name="m1.small",
    image_name="Ubuntu Server 22.04",
    key_pair="jbriault",
    security_groups=["secgroup01"],
    networks=[{"name": "tenant_network"}],
    user_data=cloud_init_script,
)

# Création de l'adresse IP flottante
floating_ip = openstack.networking.FloatingIp("demo-floating-ip",
    pool="external_network"
)

# Créer un enregistrement DNS pour l'instance (pub)
pub_record = openstack.dns.RecordSet("demo-instance-pub-record",
    name="test-pub.pulumi.demo.",
    zone_id=zone.id,
    records=[floating_ip.address],
    type="A",
    ttl=300
)

# Association de l'adresse IP flottante à l'instance
floating_ip_association = openstack.compute.FloatingIpAssociate("demo-floating-ip-association",
    floating_ip=floating_ip.address,
    instance_id=instance.id
)

# Exporter les adresses IP (pour débogage)
pulumi.export("instance_floating_ip", instance.floating_ip)
pulumi.export("instance_internal_ip", instance.access_ip_v4)
