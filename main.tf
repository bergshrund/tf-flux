module "kind_cluster" {
  source = "./modules/tf-kind-cluster"
}

module "github_repository" {
  source                   = "./modules/tf-github-repository"
  github_account           = var.github_account
  github_access_token      = var.github_access_token
  repository_name          = var.github_repo
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux"
}

module "flux_bootstrap" {
  source             = "./modules/tf-flux-bootstrap"
  kubeconfig_paths   = module.kind_cluster.kubeconfig_path
  kubeconfig_context = module.kind_cluster.context
  github_account     = var.github_account
  github_repository  = var.github_repo
  private_key        = module.tls_private_key.private_key_pem
}

module "tls_private_key" {
  source    = "./modules/tf-hashicorp-tls-key"
  algorithm = "RSA"
}
