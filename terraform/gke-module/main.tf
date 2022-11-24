provider "google" {
  project = var.project_name
  credentials = file(var.json_credential)
}