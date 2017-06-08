provider "google" {
  project = "tech-conf-2017"
  region = "europe-west1"
}

resource "google_container_cluster" "cluster" {
  name = "tech-conf-2017"
  description = "kubernetes cluster for tech conf 2017"
  zone = "europe-west1-c"
  monitoring_service = "monitoring.googleapis.com"
  initial_node_count = 2

  additional_zones = [
    "europe-west1-b"
  ]

  master_auth {
    username = "admin"
    password = "super.secret"
  }
  node_config {
    machine_type = "n1-standard-2"
    disk_size_gb = "10s"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
