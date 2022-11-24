data "google_container_cluster" "gke-cluster" {
  project  = var.project_name
  provider = google-beta
  name     = var.gke_cluster_name
  location = var.region
}

resource "google_gke_hub_membership" "membership" {
  project       = var.project_name
  provider      = google-beta
  membership_id = "membership-hub-${data.google_container_cluster.gke-cluster.name}"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${data.google_container_cluster.gke-cluster.id}"
    }
  }
}

resource "google_gke_hub_feature" "configmanagement_acm_feature" {
  project  = var.project_name
  name     = "configmanagement"
  location = "global"
  provider = google-beta
}

resource "google_gke_hub_feature_membership" "feature_member" {
  project    = var.project_name
  provider   = google-beta
  location   = "global"
  feature    = "configmanagement"
  membership = google_gke_hub_membership.membership.membership_id
  configmanagement {
    version = "1.8.0"
    config_sync {
      source_format = "unstructured"
      git {
        sync_repo   = var.sync_repo
        sync_branch = var.sync_branch
        policy_dir  = var.policy_dir
        secret_type = "none"
      }
    }
  }
  depends_on = [
    google_gke_hub_feature.configmanagement_acm_feature
  ]
}