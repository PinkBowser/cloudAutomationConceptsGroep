resource "google_container_cluster" "autopilot" {
  name = "autopilot-cluster"
  enable_autopilot = true
  deletion_protection = false
}