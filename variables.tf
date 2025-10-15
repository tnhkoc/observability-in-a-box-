variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "observability"
}

variable "cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
}

variable "cluster_ca" {
  description = "EKS cluster CA certificate (base64)"
  type        = string
}

variable "cluster_token" {
  description = "Authentication token for the cluster"
  type        = string
}

variable "grafana_admin_password" {
  description = "Grafana admin password"
  type        = string
  sensitive   = true
  default     = "ChangeMe123!"
}
