/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

data "google_folders" "env-folder" {
  for_each  = { for name in data.google_folders.workload-folder.folders : name.name => name }
  parent_id = each.value.name
}

#Env-folder P1,P2,P3 -> d,s,p
module "folders_wktype" {
  for_each = { for i, v in values(module.folders_env)[*].ids_list : i => v }
  source   = "terraform-google-modules/folders/google"
  version  = "~> 3.0"

  parent = each.value[0]

  names = [
    "exposed",
    "non-exposed",
    "secure"
  ]
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