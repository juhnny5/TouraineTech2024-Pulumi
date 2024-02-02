terraform {
    required_version = ">= 0.14.0"
    required_providers {
        openstack = {
        source  = "terraform-provider-openstack/openstack"
        version = "~> 1.53.0"
        }
    }
}

provider "openstack" {
    user_name   = "xxx"
    tenant_name = "xxx"
    password    = "xxx"
    auth_url    = "xxx"
    region      = "xxx"
}

cloud_init_script = <<-EOF
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
EOF

resource "openstack_compute_instance_v2" "demo-instance" {
    name            = "demo-instance"
    image_name      = "Ubuntu Server 22.04"
    flavor_name     = "m1.small"
    key_pair        = "jbriault"
    security_groups = ["secgroup01"]
    user_data       = cloud_init_script
    networks {
        name = "tenant_network"
    }
}
