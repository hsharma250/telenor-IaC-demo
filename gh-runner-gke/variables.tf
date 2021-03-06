/**
 * Copyright 2020 Google LLC
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

variable "project_id" {
  type        = string
  description = "The project id to deploy Github Runner MIG"
  default     = "test-project-350005"
}

variable "repo_url" {
  type        = string
  description = "Repo URL for the Github Action"
  default     = "https://github.com/hsharma250/telenor-IaC-demo"
}
variable "repo_name" {
  type        = string
  description = "Name of the repo for the Github Action"
  default     = "telenor-iac-demo"
}

variable "repo_owner" {
  type        = string
  description = "Owner of the repo for the Github Action"
  default     = "hsharma250"
}

variable "gh_token" {
  type        = string
  description = "Github token that is used for generating Self Hosted Runner Token"
  default     = "AZEKID5ONA4JHQM5QI3AIT3CQVPAK"
}
