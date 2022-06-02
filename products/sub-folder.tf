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
# locals {
#   #Map stores folder ids as key and folder name as value for Products
#   #This map is used to get the id of child environment folder of all products
#   # folder-map = {
#   #   for folder in data.google_folders.product-folder.folders :
#   #   folder.name => folder.display_name
#   # }
#   #Map stores products as key and folder id of child env folder
#   #This map is used to create the workload type inside the respective environment folder
#   product-map-child = {
#     for folder in data.google_active_folder.dev :
#     lookup(local.folder-map, folder.parent) => folder.name
#   }
# }

# #This data block gets the folder id of environment's subfolder inside product
# data "google_active_folder" "dev" {
#   depends_on = [
#     module.folders_env
#   ]
#   for_each     = local.folder-map
#   display_name = var.env
#   parent       = each.key
# }

# module "folders_wktype" {
#   for_each = local.product-map-child
#   source   = "terraform-google-modules/folders/google"
#   version  = "~> 3.0"
#   parent   = each.value
#   names    = lookup(var.product_wktype_map, each.key)
#   # names = [
#   #   "exposed",
#   #   "non-exposed",
#   #   "secure"
#   # ]
#   # set_roles = true

#   # per_folder_admins = {
#   #   dev = "group:gcp-developers@domain.com"
#   #   staging = "group:gcp-qa@domain.com"
#   #   production = "group:gcp-ops@domain.com"
#   # }

#   # all_folder_admins = [
#   #   "group:gcp-security@domain.com",
#   # ]
# }