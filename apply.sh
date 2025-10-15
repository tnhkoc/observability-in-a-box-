#!/bin/bash
echo "🚀 Starting Observability Stack Deployment..."

terraform init
terraform apply -auto-approve

echo ""
echo "✅ Deployment complete!"
echo "Use the following command to access Grafana:"
echo "kubectl get svc -n observability"
