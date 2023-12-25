variable "project_id" {
  description = ""
  type        = string
}

variable "impersonate_service_account" {
  description = ""
  type        = string
}

variable "region" {
  description = ""
  type        = string
}

variable "zone" {
  description = ""
  type        = string
}

variable "cluster_name" {
  description = ""
  type        = string
}

variable "vpc_network_name" {
  description = ""
  type        = string
}

variable "vpc_subnetwork_name" {
  description = ""
  type        = string
}

variable "vpc_subnetwork_range" {
  description = ""
  type        = string
}

variable "pods_subnetwork_range" {
  description = ""
  type        = string
}

variable "svc_subnetwork_range" {
  description = ""
  type        = string
}

variable "node_pool_name" {
  description = ""
  type        = string
}

variable "node_poll_machine_type" {
  description = ""
  type        = string
}

variable "node_poll_size" {
  description = ""
  type        = number
}

variable "cluster_service_account_iam_roles" {
  type = list(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/stackdriver.resourceMetadata.writer"
  ]
  description = "List of IAM roles to assign to the default Kubernetes cluster service account."
}

variable "cluster_service_account_custom_iam_roles" {
  type        = list(string)
  default     = []
  description = "List of arbitrary additional IAM roles to attach to the service account on the Kubernetes clusters nodes."
}

