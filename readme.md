![Terraform](https://img.shields.io/badge/Terraform-1.5+-purple?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EKS-orange?logo=amazonaws)
![Grafana](https://img.shields.io/badge/Monitoring-Grafana%20%26%20Prometheus-yellow?logo=grafana)

# 🚀 Observability in a Box – AWS EKS + Terraform

A production-ready Terraform automation that deploys a **complete observability stack (Prometheus + Grafana)** on your **AWS EKS cluster** in minutes.

> Created by **Tunahan Koç**  
> Cloud & DevOps Engineer | AWS Certified Cloud Practitioner

---

## 🌐 Overview

This project provides an easy way to deploy a full observability setup (Prometheus + Grafana) on your AWS EKS cluster using Terraform and Helm.

### What's Inside
- `main.tf` → Terraform configuration for AWS + Helm providers  
- `values.yaml` → Helm chart overrides for Prometheus and Grafana  
- `apply.sh` → One-click deployment script  
- `uninstall.sh` → Cleanup script  
- `grafana-dashboard.json` → Example dashboard for Kubernetes metrics  
- `quickstart.pdf` → Documentation & visual guide  

---

## ⚙️ Requirements

| Tool | Version |
|------|----------|
| Terraform | ≥ 1.5 |
| AWS CLI | Configured and authenticated |
| EKS Cluster | Must already exist |
| kubectl | Configured for EKS context |

Check your setup:
```bash
terraform -version
aws sts get-caller-identity
kubectl get nodes
```

---

## 🚀 Quick Start

Clone the repository and execute the deployment script:

```bash
git clone https://github.com/tunahan-koc/observability-in-a-box.git
cd observability-in-a-box
chmod +x apply.sh
./apply.sh
```

When the script completes, Grafana will be accessible via a LoadBalancer URL.

---

## 📊 Access Grafana

Get Grafana's external URL:
```bash
kubectl get svc grafana -n observability
```

Then open the URL in your browser:  
**http://<external-ip>**  

Default credentials:  
```
Username: admin
Password: <your password or default>
```

---

## 🧩 File Structure

```
observability-in-a-box/
├── apply.sh
├── uninstall.sh
├── main.tf
├── outputs.tf
├── variables.tf
├── terraform.tfvars.example
├── values.yaml
├── grafana-dashboard.json
└── quickstart.pdf
```

---

## 🧹 Uninstall

To remove all resources deployed by Terraform:
```bash
./uninstall.sh
```

---

## 🧠 Troubleshooting

**Grafana not showing data?**  
- Wait 2–3 minutes for Prometheus to scrape metrics  
- Check Prometheus pod status:
  ```bash
  kubectl get pods -n observability
  ```

**LoadBalancer pending?**  
- Verify that your cluster supports public LoadBalancer services  
- Ensure your subnet has an Internet Gateway

---

## 💡 Example Outputs

```bash
Apply complete! Resources: 7 added.
Grafana LoadBalancer URL:
http://ab1234c567d890.elb.amazonaws.com
```

---

## 🧰 Customization

### Change Namespace
Edit in `variables.tf`:
```hcl
variable "namespace" {
  default = "observability"
}
```

### Custom Grafana Password
Set in `terraform.tfvars`:
```hcl
grafana_admin_password = "SecurePass123!"
```

---

## 🧾 License & Author

MIT License © 2025 **Tunahan Koç**  
LinkedIn: [linkedin.com/in/tunahan-koc-8b43b765](https://linkedin.com/in/tunahan-koc-8b43b765)

---

### ⭐ If you like this project, give it a star and share it!

