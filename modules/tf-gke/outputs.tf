output "kubeconfig_path" {
  value       = "${path.module}/kubeconfig"
  description = "The path to the kubeconfig file"
}

output "context" {
  value       = module.gke.name
  description = "The name of the context in kubeconfig"
}




