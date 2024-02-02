import yaml
import pulumi
import pulumi_openstack as openstack

zones_file = 'zones.yaml'

with open(zones_file, 'r') as file:
    content = yaml.safe_load(file)

for c in content:
    fqdn = c['name']
    nfqdn = fqdn.rstrip(".")
    nfqdn2 = nfqdn.replace(".", "-")
    
    zone = openstack.dns.Zone(nfqdn2,
        name=fqdn,
        description=c['description'],
        email=c['email'],
        ttl=c['ttl'],
        type=c['type']
    )
