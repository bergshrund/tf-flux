data "local_file" "kbot_repo" {
  filename = "./kbot/kbot-repo.yaml"
}

data "local_file" "kbot_helm_release" {
  filename = "./kbot/kbot-helmrelease.yaml"
}

resource "github_repository_file" "kbot_repo_yaml" {
  repository          = var.repository_name
  branch              = "main"
  file                = "clusters/kbot/kbot-repo.yaml"
  content             = data.local_file.kbot_repo
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@data1.co"
  overwrite_on_create = true
}

resource "github_repository_file" "kbot_helm_release_yaml" {
  repository          = var.repository_name
  branch              = "main"
  file                = "clusters/kbot/kbot-helmrelease.yaml"
  content             = data.local_file.kbot_helm_release
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@data1.co"
  overwrite_on_create = true
}