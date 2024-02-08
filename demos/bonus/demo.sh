#!/bin/bash

# Original script: curl -LO https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh
. ../../lib/demo_magic.sh

source ../../.env
source $HOME/.keystonerc

TYPE_SPEED=50 # Accelerate typing
DEMO_CMD_COLOR="" # No bold
DEMO_PROMPT="${BLUE}demo-4$ ${COLOR_RESET}"
DEMO_COMMENT_COLOR=$CYAN

# Store state in MinIO
pei "# Stocker le state dans MinIO"
pe "pulumi login \"s3://plstate-openstack-demo5?endpoint=${VM_IP}:9000&disableSSL=true&s3ForcePathStyle=true\""
pei "# Convertir le projet de YAML vers Python"
p "pulumi convert  --language python"
