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

data "google_active_folder" "workloads" {
  display_name = var.division_foldername
  parent       = "organizations/${var.org_id}"
}

module "security_folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent = data.google_active_folder.workloads.name

  names = var.products_list
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