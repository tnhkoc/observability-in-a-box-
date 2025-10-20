output "grafana_service" {
  value       = helm_release.grafana.status
  description = "Grafana deployment status"
}

output "grafana_url_hint" {
  value       = "Run `kubectl get svc -n ${var.namespace}` to find the Grafana LoadBalancer URL."
}
