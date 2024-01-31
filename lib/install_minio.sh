#!/bin/bash

deb_package_name="minio_20240129035632.0.0_arm64.deb"
wget https://dl.minio.io/server/minio/release/linux-arm64/${deb_package_name}
sudo dpkg -i ${deb_package_name}
sudo groupadd -r minio-user
sudo useradd -M -r -g minio-user minio-user -s /sbin/nologin
sudo mkdir /usr/local/share/minio
sudo chown minio-user: /usr/local/share/minio
sudo mkdir /etc/minio
sudo chown minio-user: /etc/minio
sudo echo 'MINIO_ACCESS_KEY="minio"
MINIO_VOLUMES="/usr/local/share/minio/"
MINIO_OPTS="-C /etc/minio --address 0.0.0.0:9000"
MINIO_SECRET_KEY="miniostorage"' > /etc/default/minio
sudo ufw allow 9000
sudo ufw allow 22
sudo systemctl restart minio
