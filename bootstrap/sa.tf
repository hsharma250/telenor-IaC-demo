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

module "tf_service_account" {
  depends_on = [
    module.seed_project_platform
  ]
  source          = "terraform-google-modules/service-accounts/google"
  version         = "~> 3.0"
  project_id      = module.seed_project_platform.project_id
  org_id          = var.org_id
  grant_xpn_roles = false
  prefix          = "telenor"
  names           = ["tf-sa"]
  project_roles = [
    "${module.seed_project_platform.project_id}=>roles/storage.objectAdmin",
  ]
}