#data "local_file" "kbot_namespace" {
#  filename = "./modules/tf-kbot/kbot/kbot-ns.yaml"
#}

#data "local_file" "kbot_repo" {
#  filename = "./modules/tf-kbot/kbot/kbot-repo.yaml"
#}

#data "local_file" "kbot_helm_release" {
#  filename = "./modules/tf-kbot/kbot/kbot-helmrelease.yaml"
#}

data "local_file" "rd_file" {
  count = length(var.files)
  filename = "./modules/tf-kbot/${var.files[count.index]}"
}

resource "github_repository_file" "file" {
  count = length(var.files) 
  repository          = var.repository_name
  branch              = "main"
  file                = "${var.target_path}/${var.files[count.index]}"
  content             = data.local_file.rd_file[count.index].content
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "bergshrund@gmail.com"
  overwrite_on_create = true
}

#resource "github_repository_file" "kbot_ns_yaml" {
#  repository          = var.repository_name
#  branch              = "main"
#  file                = "clusters/kbot/kbot-ns.yaml"
#  content             = data.local_file.kbot_namespace.content
#  commit_message      = "Managed by Terraform"
#  commit_author       = "Terraform User"
#  commit_email        = "terraform@data1.co"
#  overwrite_on_create = true
#}

#resource "github_repository_file" "kbot_repo_yaml" {
#  repository          = var.repository_name
#  branch              = "main"
#  file                = "clusters/kbot/kbot-repo.yaml"
#  content             = data.local_file.kbot_repo.content
#  commit_message      = "Managed by Terraform"
#  commit_author       = "Terraform User"
#  commit_email        = "terraform@data1.co"
#  overwrite_on_create = true
#}

#resource "github_repository_file" "kbot_helm_release_yaml" {
#  repository          = var.repository_name
#  branch              = "main"
#  file                = "clusters/kbot/kbot-helmrelease.yaml"
#  content             = data.local_file.kbot_helm_release.content
#  commit_message      = "Managed by Terraform"
#  commit_author       = "Terraform User"
#  commit_email        = "terraform@data1.co"
#  overwrite_on_create = true
#}
