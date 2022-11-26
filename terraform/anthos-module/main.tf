terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.73.0"
    }
  }
}
provider "google-beta" {
  project     = var.project_name
  region = "us-central1"
  credentials = file(var.json_credential)
}