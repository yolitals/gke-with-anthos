variable "project_name" {
  type        = string
  description = "Project name where GKE Cluster will be created"

}
variable "location" {
  type        = string
  description = "Region where GKE Cluster will be created"

}
variable "json_credential" {
  type        = string
  description = "Path of Service Account Json key"

}
variable "service_account_id" {
  type        = string
  description = "ID of Service Account for GKE node pool"
}
variable "gke_cluster_name" {
  type        = string
  description = "GKE cluster name"
}
variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool"
}
variable "remove_default_node_pool" {
  type        = bool
  description = "If true, deletes the default node pool upon cluster creation"
}

variable "node_pool_count" {
  type        = number
  description = "The number of nodes per instance group"
}

variable "node_config_preemptible" {
  type        = bool
  description = "A boolean that represents whether or not the underlying node VMs are preemptible"
}
variable "node_config_machine_type" {
  type        = string
  description = "The name of a Google Compute Engine machine type."
}
variable "node_config_disk_size_gb" {
  type = number
  description = "Size of the disk attached to each node, specified in GB."
}