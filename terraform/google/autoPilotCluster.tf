resource "google_container_cluster" "autopilot" {
  name = "autopilot-cluster-cloudshirt"
  enable_autopilot = true
  deletion_protection = false
}