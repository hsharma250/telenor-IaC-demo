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

variable "org_id" {
  description = "The organization ID."
  type        = string
  default     = "435160234064"
}

variable "divisions" {
  type        = list(string)
  description = "Folder names for each environment."
  default     = ["Workloads", "Platform", "Security"]
}

variable "seed_project_id" {
  type        = string
  description = "Project ID of the seed project."
  default     = "prj-telenor-prd-seed"
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
  default     = "01346D-935252-68647E"
}

variable "bucket_location" {
  description = "The location of bucket"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "The name of storage bucket"
  type        = string
  default     = "telenor-sample-state-bkt"
}