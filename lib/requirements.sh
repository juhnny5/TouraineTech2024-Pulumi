# Vérifier que les binaires (multipass et pulumi) sont bien installés.
if command -v pulumi &>/dev/null; then
    pulumi_version=$(pulumi version)
    echo "[✅] Pulumi est installé (version $pulumi_version)."
else
    echo "[❌] Pulumi n'est pas installé."
    exit 1
fi

if command -v multipass &>/dev/null; then
    multipass_version=$(multipass version)
    echo "[✅] Multipass est installé."
else
    echo "[❌] Multipass n'est pas installé."
    exit 1
fi
