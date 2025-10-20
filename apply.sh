#!/bin/bash

echo "🚀 EKS Observability Setup"
echo "========================="
echo ""

# Check terraform
if ! command -v terraform &> /dev/null; then
    echo "❌ Please install Terraform first"
    exit 1
fi

# Get cluster name
read -p "EKS Cluster Name: " CLUSTER_NAME
if [ -z "$CLUSTER_NAME" ]; then
    echo "❌ Cluster name required!"
    exit 1
fi

# Optional: region
read -p "AWS Region (press Enter for eu-central-1): " REGION
REGION=${REGION:-eu-central-1}

# Optional: password
read -sp "Grafana Password (press Enter for default): " PASS
echo ""
PASS=${PASS:-ChangeMe123!}

# Create terraform.tfvars
cat > terraform.tfvars <<EOF
cluster_name           = "$CLUSTER_NAME"
region                 = "$REGION"
grafana_admin_password = "$PASS"
EOF

echo "✅ Config saved"
echo ""

# Deploy
echo "📦 Initializing..."
terraform init -upgrade

echo ""
echo "🚀 Deploying (takes 3-5 minutes)..."
if terraform apply -auto-approve; then
    echo ""
    echo "✅ DONE!"
    echo ""
    echo "Get Grafana URL:"
    echo "  kubectl get svc grafana -n observability"
    echo ""
    echo "Login:"
    echo "  User: admin"
    echo "  Pass: $PASS"
else
    echo "❌ Failed! Check errors above."
fi