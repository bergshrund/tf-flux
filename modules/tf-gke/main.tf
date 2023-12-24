provider "google" {
  project = var.project_id
  region  = var.region
  impersonate_service_account = var.impersonate_service_account
}

resource "google_compute_network" "this" {
  name = var.vpc_network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {

  depends_on = [google_compute_network.this]
  
  name = var.vpc_subnetwork_name
  ip_cidr_range = var.vpc_subnetwork_range
  region = var.region
  network = google_compute_network.this.id
  private_ip_google_access = false

  secondary_ip_range {
    range_name    = "${var.vpc_subnetwork_name}-pods-subnet"
    ip_cidr_range = var.pods_subnetwork_range
  }

  secondary_ip_range {
    range_name    = "${var.vpc_subnetwork_name}-svc-subnet"
    ip_cidr_range = var.svc_subnetwork_range
  }

}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "29.0.0"

  project_id = var.project_id
  name = var.cluster_name
  
  region = var.region
  zones = var.zones

  network = google_compute_network.this.name
  subnetwork = google_compute_subnetwork.this.name

  ip_range_pods              = "${vpc_subnetwork_name}-pods-subnet"
  ip_range_services          = "${vpc_subnetwork_name}-svc-subnet"
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = false

  create_service_account     = false
  remove_default_node_pool   = true
  node_pools = [
    {
      name                      = var.node_pool_name
      service_account           = google_service_account.cluster_service_account.email
      machine_type              = var.node_poll_machine_type
      node_count                = var.node_poll_size
      node_locations            = var.zones
      local_ssd_count           = 0
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_secure_boot        = true
      auto_repair               = true
      auto_upgrade              = true
      autoscaling               = false
      preemptible               = true
    },
  ]
}