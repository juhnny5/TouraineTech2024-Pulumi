#!/bin/bash

multipass delete minio
echo "[✅] Machine virtuelle supprimée."
multipass purge
echo "[✅] Cache multipass supprimé."
