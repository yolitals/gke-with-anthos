module "name" {
  source                   = "./gke-module"
  location                 = "us-central1-b"
  service_account_id       = "gke-node-pool-prod"
  gke_cluster_name         = "dev-fest-cdmx-2022-prod"
  initial_node_count       = 1
  remove_default_node_pool = true
  node_pool_count          = 4
  node_config_preemptible  = true
  node_config_machine_type = "e2-medium"
  node_config_disk_size_gb = 10
  json_credential          = "/Users/yolandalopezsolis/projects/gcp-terraform/gcp/.credentials/wwcode-terraform-admin-44f7f3980bb1.json"
  project_name             = "wwcode-terraform-admin"
}
module "anthos_prod" {
  source           = "./anthos-module"
  region           = "us-central1-b"
  gke_cluster_name = "dev-fest-cdmx-2022-prod"
  sync_repo        = "https://github.com/yolitals/gke-with-anthos.git"
  sync_branch      = "master"
  policy_dir       = "anthos/policies/config-demo"
  json_credential  = "/Users/yolandalopezsolis/projects/gcp-terraform/gcp/.credentials/wwcode-terraform-admin-44f7f3980bb1.json"
  project_name     = "wwcode-terraform-admin"

}
module "anthos_dev" {
  source           = "./anthos-module"
  region           = "us-central1-b"
  gke_cluster_name = "dev-fest-cdmx-2022-dev"
  sync_repo        = "https://github.com/yolitals/gke-with-anthos.git"
  sync_branch      = "master"
  policy_dir       = "anthos/policies/config-demo"
  json_credential  = "/Users/yolandalopezsolis/projects/gcp-terraform/gcp/.credentials/wwcode-terraform-admin-44f7f3980bb1.json"
  project_name     = "wwcode-terraform-admin"

}