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

# Créer un enregistrement DNS pour l'instance (pub)
pub_record = openstack.dns.RecordSet("demo-instance-pub-record",
    name="test-pub.pulumi.demo.",
    zone_id=zone.id,
    records=[floating_ip.address],
    type="A",
    ttl=300
)
