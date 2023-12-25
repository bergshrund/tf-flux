provider "github" {
  owner = var.github_account
  token = var.github_access_token
}


module "gke_cluster" {
   source = "./modules/tf-gke"
   project_id = "data1co"
   impersonate_service_account = "devops@data1co.iam.gserviceaccount.com"
   region = "us-central1"
   zones = ["us-central1-a"]
   cluster_name = "test-cluster"
   vpc_network_name = "test-vpc"
   vpc_subnetwork_name = "test-vpc-subnet"
   vpc_subnetwork_range = "192.168.1.0/24" 
   pods_subnetwork_range = "10.10.0.0/16"
   svc_subnetwork_range = "10.20.0.0/20"
   node_pool_name = "default-pool"
   node_poll_machine_type = "e2-micro"
   node_poll_size = "1"
}


#module "kind_cluster" {
#  source = "./modules/tf-kind-cluster"
#}

#module "flux_bootstrap" {
#  source              = "./modules/tf-flux-bootstrap"
#  kubeconfig_paths    = module.kind_cluster.kubeconfig_path
#  kubeconfig_context  = module.kind_cluster.context
#  github_account      = var.github_account
#  github_repository   = var.github_repo
#  github_access_token = var.github_access_token
#  private_key         = module.tls_private_key.private_key_pem
#  public_key          = module.tls_private_key.public_key_openssh
#}

#module "kbot" {
#  depends_on = [ module.flux_bootstrap.flux_id ]
#  source              = "./modules/tf-kbot"
#  repository_name     = var.github_repo
#  target_path         = module.flux_bootstrap.flux_path
#  files = ["kbot/kbot-ns.yaml","kbot/kbot-repo.yaml","kbot/kbot-helmrelease.yaml"]
#}

#module "tls_private_key" {
#  source    = "./modules/tf-hashicorp-tls-key"
#  algorithm = "RSA"
#}
