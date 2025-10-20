#!/bin/bash

echo "🗑️  Uninstalling..."
terraform destroy -auto-approve
echo "✅ Done!"