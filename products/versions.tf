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

terraform {
  required_version = ">=0.13.0"
  backend "gcs" {
    bucket = "tf-state-telenor"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.11"
    }
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "~> 0.1"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.11"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-project-factory/v13.0.0"
  }
  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-project-factory/v13.0.0"
  }
}
#Region and zone can be overriden in resource definition
provider "google" {
  project = "test-project-350005"
  region  = "us-central1"
  zone    = "us-central1-c"
}
provider "google-beta" {
  project = "test-project-350005"
  region  = "us-central1"
  zone    = "us-central1-c"
}
provider "gsuite" {
  impersonated_user_email = "terraform-sa-demo@test-project-350005.iam.gserviceaccount.com"
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
  ]
}
