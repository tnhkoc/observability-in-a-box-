variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "Existing EKS cluster name"
  type        = string
}
