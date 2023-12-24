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

variable "zones" {
  description = ""
  type        = list(string)
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
  type        = string
}