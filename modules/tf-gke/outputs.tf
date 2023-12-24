output "kubeconfig" {
  value       = data.google_client_config.default
  sensitive   = true
  description = "The full text of the kubeconfig that can be used to connect to this cluster"
}