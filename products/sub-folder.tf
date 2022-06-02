# /**
#  * Copyright 2018 Google LLC
#  *
#  * Licensed under the Apache License, Version 2.0 (the "License");
#  * you may not use this file except in compliance with the License.
#  * You may obtain a copy of the License at
#  *
#  *      http://www.apache.org/licenses/LICENSE-2.0
#  *
#  * Unless required by applicable law or agreed to in writing, software
#  * distributed under the License is distributed on an "AS IS" BASIS,
#  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  * See the License for the specific language governing permissions and
#  * limitations under the License.
#  */
#for_each = { for name in data.google_folders.product-folder.folders : name.name => name }
locals {
  product-dev-map = {
    for folder in data.google_active_folder.dev :
    lookup(local.product-folderid-map, folder.parent) => folder.name
  }
  product-stage-map = {
    for folder in data.google_active_folder.dev :
    lookup(local.product-folderid-map, folder.parent) => folder.name
  }
  product-prod-map = {
    for folder in data.google_active_folder.dev :
    lookup(local.product-folderid-map, folder.parent) => folder.name
  }
}

#This data block gets the folder id of environment's subfolder inside product
data "google_active_folder" "dev" {
  depends_on = [
    module.folders_env
  ]
  for_each     = local.product-folderid-map
  display_name = "Dev"
  parent       = each.key
}
#This data block gets the folder id of environment's subfolder inside product
data "google_active_folder" "stage" {
  depends_on = [
    module.folders_env
  ]
  for_each     = local.product-folderid-map
  display_name = "Stage"
  parent       = each.key
}
#This data block gets the folder id of environment's subfolder inside product
data "google_active_folder" "prod" {
  depends_on = [
    module.folders_env
  ]
  for_each     = local.product-folderid-map
  display_name = "Prod"
  parent       = each.key
}

module "folders_dev_wktype" {
  for_each = local.product-dev-map
  source   = "terraform-google-modules/folders/google"
  version  = "~> 3.0"
  parent   = each.value
  names    = lookup(var.product_dev_wktype_map, each.key)
  # set_roles = true

  # per_folder_admins = {
  #   dev = "group:gcp-developers@domain.com"
  #   staging = "group:gcp-qa@domain.com"
  #   production = "group:gcp-ops@domain.com"
  # }

  # all_folder_admins = [
  #   "group:gcp-security@domain.com",
  # ]
}

module "folders_stage_wktype" {
  for_each = local.product-stage-map
  source   = "terraform-google-modules/folders/google"
  version  = "~> 3.0"
  parent   = each.value
  names    = lookup(var.product_stage_wktype_map, each.key)
  # set_roles = true

  # per_folder_admins = {
  #   dev = "group:gcp-developers@domain.com"
  #   staging = "group:gcp-qa@domain.com"
  #   production = "group:gcp-ops@domain.com"
  # }

  # all_folder_admins = [
  #   "group:gcp-security@domain.com",
  # ]
}

module "folders_prod_wktype" {
  for_each = local.product-prod-map
  source   = "terraform-google-modules/folders/google"
  version  = "~> 3.0"
  parent   = each.value
  names    = lookup(var.product_prod_wktype_map, each.key)
  # set_roles = true

  # per_folder_admins = {
  #   dev = "group:gcp-developers@domain.com"
  #   staging = "group:gcp-qa@domain.com"
  #   production = "group:gcp-ops@domain.com"
  # }

  # all_folder_admins = [
  #   "group:gcp-security@domain.com",
  # ]
}