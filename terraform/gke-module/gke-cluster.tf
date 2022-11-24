resource "google_service_account" "default" {
  project      = var.project_name
  account_id   = var.service_account_id
  display_name = var.service_account_id
}

resource "google_container_cluster" "primary" {
  project                  = var.project_name
  name                     = var.gke_cluster_name
  location                 = var.location
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  node_config {
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    preemptible  = var.node_config_preemptible
    machine_type = var.node_config_machine_type
    disk_size_gb = var.node_config_disk_size_gb
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  project    = var.project_name
  name       = "${var.gke_cluster_name}-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_pool_count

  node_config {
    preemptible  = var.node_config_preemptible
    machine_type = var.node_config_machine_type
    disk_size_gb = var.node_config_disk_size_gb
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}