data "local_file" "kbot_namespace" {
  filename = "./modules/tf-kbot/kbot/kbot-ns.yaml"
}

data "local_file" "kbot_repo" {
  filename = "./modules/tf-kbot/kbot/kbot-repo.yaml"
}

data "local_file" "kbot_helm_release" {
  filename = "./modules/tf-kbot/kbot/kbot-helmrelease.yaml"
}

resource "github_repository_file" "kbot_ns_yaml" {
  repository          = var.repository_name
  branch              = "main"
  file                = "clusters/kbot/kbot-ns.yaml"
  content             = data.local_file.kbot_namespace.content
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@data1.co"
  overwrite_on_create = true
}

resource "github_repository_file" "kbot_repo_yaml" {
  repository          = var.repository_name
  branch              = "main"
  file                = "clusters/kbot/kbot-repo.yaml"
  content             = data.local_file.kbot_repo.content
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@data1.co"
  overwrite_on_create = true
}

resource "github_repository_file" "kbot_helm_release_yaml" {
  repository          = var.repository_name
  branch              = "main"
  file                = "clusters/kbot/kbot-helmrelease.yaml"
  content             = data.local_file.kbot_helm_release.content
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@data1.co"
  overwrite_on_create = true
}
