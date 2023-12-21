provider "flux" {
  kubernetes = {
    config_path = var.kubeconfig_paths
    config_context = var.kubeconfig_context
  }

  git = {
    url = "ssh://git@github.com/${var.github_account}/${var.github_repository}.git"
    ssh = {
      username    = "git"
      private_key = var.private_key
    }
  }
}

resource "flux_bootstrap_git" "this" {
  path = var.target_path
}