resource "google_container_cluster" "my_gke_cluster" {
    name = "selin-k8s-terraform"
    location = var.region
    initial_node_count = 1
}


resource "google_container_node_pool" "preemptible_nodes" {
  name       = "selin-node-pool"
  location   = var.region
  cluster    = google_container_cluster.my_gke_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine-type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}