variable "github_account" {
  type        = string
  description = "The GitHub account that own repository"
}

variable "github_access_token" {
  type        = string
  description = "GitHub access token"
}

variable "github_repo" {
  type        = string
  description = "Flux configuration repo"
}

variable "project_id" {
  type        = string
  description = ""
}

variable "region" {
  type        = string
  description = ""
}

variable "zone" {
  type        = string
  description = ""
}

variable "cluster_name" {
  type        = string
  description = ""
}

variable "vpc_network_name" {
  type        = string
  description = ""
}

variable "vpc_subnetwork_name" {
  type        = string
  description = ""
}

variable "pods_subnetwork_range" {
  type        = string
  description = ""
}

variable "svc_subnetwork_range" {
  type        = string
  description = ""
}

variable "node_pool_name" {
  type        = string
  description = ""
}

variable "node_poll_machine_type" {
  type        = string
  description = ""
}

variable "node_poll_size" {
  type        = string
  description = ""
}

variable "impersonate_service_account" {
  type        = string
  description = ""
}

variable "vpc_subnetwork_range" {
  type        = string
  description = ""
}

variable "" {
  type        = string
  description = ""
}