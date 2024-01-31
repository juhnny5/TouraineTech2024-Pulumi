vm_name="minio"
multipass launch --name ${vm_name} --cpus 2 --mem 4G --disk 20G
multipass stop ${vm_name}

# Astuce macOS pour le problème de NAT
sudo pfctl -f /etc/pf.conf
sudo pfctl -s all

multipass start ${vm_name}

# Transférer le script d'installation de MinIO
multipass transfer lib/install_minio.sh minio:.
