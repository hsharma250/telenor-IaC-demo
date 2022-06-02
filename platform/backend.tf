terraform {
  backend "gcs" {
    bucket = "tf-state-telenor"
    prefix = "state/platform"
  }
}