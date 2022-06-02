locals {
  env_foldermap = {
    for idx, folder in module.security_folders.folders :
    idx => folder.id
  }
}

module "security_projects_kms" {
  for_each = local.env_foldermap
  source   = "terraform-google-modules/project-factory/google"
  version  = "~> 10.1"

  random_project_id = false
  project_id        = "prj-telenor-${each.key}-${var.kms_project_suffix}"
  name              = "prj-telenor-${each.key}-${var.kms_project_suffix}"
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

  random_project_id = false
  project_id        = "prj-telenor-${each.key}-${var.logsinks_project_suffix}"
  name              = "prj-telenor-${each.key}-${var.logsinks_project_suffix}"
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

  random_project_id = false
  project_id        = var.scc_project_id
  name              = "scc-telenor"
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