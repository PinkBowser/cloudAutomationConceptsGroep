#  resource "google_container_cluster" "autopilot" {
#    name = "autopilot-cluster-cloudshirt"
#    enable_autopilot = true
#    deletion_protection = false
#  }

# resource "google_sql_database_instance" "autopilot-cloudshirt-database" {
#   name             = "autopilot-cloudshirt-database"
#   database_version = "MYSQL_8_0"
#   root_password = "CloudShirt123"
#   deletion_protection = false

#   settings {
#     tier = "db-f1-micro"
#   }
# }

resource "google_artifact_registry_repository" "cloudshirt-repo" {
  location      = "us-central1"
  repository_id = "cloudshirt-repo"
  description   = "cloudshirt-repo voor de cloudshirt website"
  format        = "DOCKER"
}

# resource "kubernetes_deployment_v1" "default" {
# }