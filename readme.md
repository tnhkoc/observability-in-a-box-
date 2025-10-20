![Terraform](https://img.shields.io/badge/Terraform-1.5+-purple?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EKS-orange?logo=amazonaws)
![Grafana](https://img.shields.io/badge/Monitoring-Grafana%20%26%20Prometheus-yellow?logo=grafana)

# 🧩 Observability in a Box

A lightweight Terraform module that deploys **Prometheus** and **Grafana** on an existing **AWS EKS** cluster.

This project provides an easy way for small teams and developers to bootstrap observability on Kubernetes without manually configuring Helm charts.

---

## 🌍 Overview

**Key features:**
- 🚀 One-command setup for monitoring on AWS EKS  
- 📊 Prometheus & Grafana deployment via Helm provider  
- ⚙️ Configurable namespace and admin credentials  
- 💡 Works with any existing EKS cluster (no extra dependencies)

---

## 🧱 Module Structure

```bash
observability-in-a-box/
├── main.tf
├── variables.tf
├── outputs.tf
└── examples/
    └── eks-basic/
        ├── provider.tf
        ├── variables.tf
        ├── values.yaml
        └── grafana-dashboard.json
```  
## ⚙️ Requirements
| Tool | Version / Note |
|------|----------------|
| Terraform | >= 1.5 |
| AWS CLI | Configured with valid credentials |
| kubectl | Access to your EKS cluster |
| Helm | Installed locally (optional, for debugging) |

---
## 🚀 Quick Start
Clone the repository and apply the example setup:

```bash
git clone https://github.com/tunahankoc/observability-in-a-box.git
cd observability-in-a-box/examples/eks-basic

terraform init
terraform apply -auto-approve
```

After a few minutes, check the Grafana service:

```bash
kubectl get svc -n observability
```

Then open the **LoadBalancer URL** in your browser and log in with:

```bash
username: admin
password: ChangeMe123!
```

---
## 🍀 Module Inputs

| Variable | Type | Default | Description |
|-----------|------|----------|-------------|
| region | string | "eu-central-1" | AWS region |
| namespace | string | "observability" | Namespace for monitoring tools |
| cluster_endpoint | string | n/a | EKS cluster API endpoint |
| cluster_ca | string | n/a | Base64 encoded cluster CA certificate |
| cluster_token | string | n/a | Token for EKS authentication |
| grafana_admin_password | string | "ChangeMe123!" | Grafana admin password |

---
## 📤 Outputs
| Output | Description |
|---------|-------------|
| grafana_service | Helm release status for Grafana |
| grafana_url_hint | Command hint to get Grafana service URL |

---
## 🧩 Example
Example EKS usage is under `examples/eks-basic`:

```hcl
module "observability" {
  source      = "../../"
  region      = "eu-central-1"
  cluster_name = "your-cluster-name"
  grafana_admin_password = "SuperSecurePassword!"
}
```

To test quickly:

```bash
cd examples/eks-basic
terraform init
terraform apply -auto-approve
```

---
## 🗺️ Roadmap
- [ ] Add Loki & Tempo integration (logs/traces)
- [ ] Add AWS Managed Grafana option
- [ ] Publish Terraform Registry module

---
## 💬 Author
**Tunahan Koç**  
Cloud & DevOps Engineer (AWS / Kubernetes / Terraform)  
[LinkedIn](https://www.linkedin.com/in/tunahan-koc-8b43b765) | [GitHub](https://github.com/tnhkoc)

---
## 🪪 License
MIT License © 2025 Tunahan Koç
