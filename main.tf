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

module "tls_private_key" {
  source    = "./modules/tf-hashicorp-tls-key"
  algorithm = "RSA"
}