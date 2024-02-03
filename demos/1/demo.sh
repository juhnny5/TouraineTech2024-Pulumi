#!/bin/bash

# Original script: curl -LO https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh
. ../../lib/demo_magic.sh

source ../../.env
source $HOME/.keystonerc

# Store state in MinIO
pe "pulumi login \"s3://plstate-openstack-demo1?endpoint=${VM_IP}:9000&disableSSL=true&s3ForcePathStyle=true\""

pe "pulumi preview --non-interactive"

pe "pulumi update --non-interactive --yes"

pe "openstack server list"
