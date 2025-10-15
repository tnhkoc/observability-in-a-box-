terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca)
    token                  = var.cluster_token
  }
}

# Prometheus
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = var.namespace
  create_namespace = true

  values = [
    file("${path.module}/examples/eks-basic/values.yaml")
  ]
}

# Grafana
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.namespace

  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
