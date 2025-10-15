terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

provider "aws" {
  region = var.region
}

# 🧩 EKS cluster bilgisini mevcut cluster'dan çekiyoruz
data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}

# 🧠 Bu provider, Terraform modülüne bağlantı sağlayacak
provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

# 🔗 Modülü çağırıyoruz (1 seferde deploy edilebilir)
module "observability" {
  source = "../../"

  region                = var.region
  namespace             = "observability"
  cluster_endpoint      = data.aws_eks_cluster.this.endpoint
  cluster_ca            = data.aws_eks_cluster.this.certificate_authority[0].data
  cluster_token         = data.aws_eks_cluster_auth.this.token
  grafana_admin_password = "ChangeMe123!"
}

output "grafana_hint" {
  value = "After apply, run: kubectl get svc -n observability"
}
