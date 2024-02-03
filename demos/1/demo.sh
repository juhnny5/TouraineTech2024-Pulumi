#!/bin/bash

# Original script: curl -LO https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh
. lib/demo_magic.sh

p "pulumi login \"s3://plstate-openstack-demo1?endpoint=${VM_IP}:9000&disableSSL=true&s3ForcePathStyle=true\""
