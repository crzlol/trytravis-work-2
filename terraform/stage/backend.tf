terraform {
  backend "gcs" {
    bucket  = "crzlol-bucket-prod"
    prefix  = "terraform/state"
  }
}