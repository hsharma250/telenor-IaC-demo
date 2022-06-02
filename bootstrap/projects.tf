/**
 * Copyright 2022 Google LLC
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
data "google_active_folder" "platform" {
  depends_on = [
    module.division_folders
  ]
  display_name = "Platform"
  parent       = "organizations/${var.org_id}"
}

module "seed_project_platform" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  random_project_id = true
  #project_id        = ""
  name              = "seed"
  org_id            = var.org_id
  billing_account   = var.billing_account
  folder_id         = data.google_active_folder.platform.name
  bucket_location   = var.bucket_location
  bucket_name       = var.bucket_name
  bucket_versioning = true

  #create_project_sa                  = var.create_project_sa
  #project_sa_name                    = var.project_sa_name
  #sa_role                            = var.sa_role
  #activate_apis                      = var.activate_apis
  #labels                             = var.labels
  #auto_create_network                = var.auto_create_network
}