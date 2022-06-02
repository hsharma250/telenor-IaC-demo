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

variable "org_id" {
  description = "The organization ID."
  type        = string
  default     = "435160234064"
}

variable "division_foldername" {
  description = "The Name of Division folder under which we want to create folder"
  type        = string
  default     = "Platform"
}

variable "environments" {
  type        = list(string)
  description = "Folder names for each environment."
  default     = ["Dev", "Stage", "Prod"]
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
  default     = "01346D-935252-68647E"
}

variable "svpc_project_suffix" {
  type        = string
  description = "Project ID suffix of the svpc project."
  default     = "svpc"
}

variable "gimages_project_suffix" {
  type        = string
  description = "Project ID suffix of the gimages project."
  default     = "gimages"
}