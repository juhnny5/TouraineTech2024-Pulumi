vm_name="minio"
multipass launch --name ${vm_name} --cpus 2 --mem 4G --disk 20G
multipass stop ${vm_name}
sudo pfctl -f /etc/pf.conf
sudo pfctl -s all
multipass start ${vm_name}
