variable "project_name" {
  type        = string
  description = "Project name where GKE Cluster will be created"

}
variable "region" {
  type        = string
  description = "Region where GKE Cluster will be created"

}
variable "json_credential" {
  type        = string
  description = "Path of Service Account Json key"

}

variable "gke_cluster_name" {
  type        = string
  description = "GKE cluster name"
}

variable "sync_repo" {
  type        = string
  description = "git URL for the repo which will be sync'ed into the cluster via Config Management"
}

variable "sync_branch" {
  type        = string
  description = "the git branch in the repo to sync"
}

variable "policy_dir" {
  type        = string
  description = "the root directory in the repo branch that contains the resources."
}