locals {
  env_foldermap = {
    for folder in module.security_folders.folders : 
    folder.name => folder.id
  }
}

module "security_projects_kms" {
  for_each = local.env_foldermap
  source   = "terraform-google-modules/project-factory/google"
  version  = "~> 10.1"

  random_project_id = true
  name              = "kms"
  org_id            = var.org_id
  billing_account   = var.billing_account
  folder_id         = each.value
  #create_project_sa                  = var.create_project_sa
  #project_sa_name                    = var.project_sa_name
  #sa_role                            = var.sa_role
  #activate_apis                      = var.activate_apis
  #labels                             = var.labels
  #auto_create_network                = var.auto_create_network
}

module "security_projects_logsinks" {
  for_each = local.env_foldermap
  source   = "terraform-google-modules/project-factory/google"
  version  = "~> 10.1"

  random_project_id = true
  name              = "log-sinks"
  org_id            = var.org_id
  billing_account   = var.billing_account
  folder_id         = each.value
  #create_project_sa                  = var.create_project_sa
  #project_sa_name                    = var.project_sa_name
  #sa_role                            = var.sa_role
  #activate_apis                      = var.activate_apis
  #labels                             = var.labels
  #auto_create_network                = var.auto_create_network
}

module "security_projects_scc" {
  for_each = local.env_foldermap
  source   = "terraform-google-modules/project-factory/google"
  version  = "~> 10.1"

  random_project_id = true
  name              = "scc"
  org_id            = var.org_id
  billing_account   = var.billing_account
  folder_id         = each.value
  #create_project_sa                  = var.create_project_sa
  #project_sa_name                    = var.project_sa_name
  #sa_role                            = var.sa_role
  #activate_apis                      = var.activate_apis
  #labels                             = var.labels
  #auto_create_network                = var.auto_create_network
}