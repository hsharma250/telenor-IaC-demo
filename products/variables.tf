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

variable "workloads_folder_id" {
  description = "The ID of Workload folder"
  type        = string
  default     = "530995789471"
}

variable "labels" {
  description = "Map of labels for project"
  type        = map(string)
  default     = {}
}

variable "environments" {
  type        = list(string)
  description = "Folder names for each environment."
  default     = ["Dev", "Stage", "Prod"]
}

variable "state_env" {
  description = "Environmeent to create project"
  type        = string
  default     = ""
}

variable "product_env_map" {
  description = "Map of products and Workload type"
  type        = map(any)
  default = { "Product1" = [
    "Dev",
    "Stage",
    "Prod"
    ], "Product2" = [
    "Dev",
    "Stage"
    ], "Product3" = [
    "Dev"
  ] }
}

variable "product_dev_wktype_map" {
  description = "Map of products and Workload type"
  type        = map(any)
  default = { "Product1" = [
    "Non-Exposed",
    "Secure"
    ], "Product2" = [
    "Non-Exposed"
    ], "Product3" = [
    "Secure"
  ] }
}

variable "product_stage_wktype_map" {
  description = "Map of products and Workload type"
  type        = map(any)
  default = { "Product1" = [
    "Non-Exposed"
    ], "Product2" = [
    "Non-Exposed"
    ], "Product3" = [
    "Secure"
  ] }
}

variable "product_prod_wktype_map" {
  description = "Map of products and Workload type"
  type        = map(any)
  default = { "Product1" = [
    "Non-Exposed"
    ], "Product2" = [
    "Non-Exposed"
  ] }
}