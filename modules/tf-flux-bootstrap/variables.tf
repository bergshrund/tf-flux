variable "kubeconfig_paths" {
  type        = string
  description = "The path to the kubeconfig file"
}

variable "kubeconfig_context" {
  type        = string
  default     = "default"
  description = "The context used in the kubeconfig file"
}

variable "github_account" {
  type        = string
  description = "The GitHub account that own source repository"
}

variable "github_repository" {
  type        = string
  description = "The GitHub repository"
}

variable "private_key" {
  type        = string
  description = "Private part of the deploy key"
}

variable "target_path" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}