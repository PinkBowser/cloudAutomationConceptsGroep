 resource "google_container_cluster" "autopilot" {
   name = "autopilot-cluster-cloudshirt"
   enable_autopilot = true
   deletion_protection = false
 }

resource "google_sql_database_instance" "autopilot-cloudshirt-database" {
  name             = "autopilot-cloudshirt-database"
  database_version = "SQLSERVER_2019_EXPRESS"
  root_password = "CloudShirt123"
  deletion_protection = false
  region = "europe-west1"

  settings {
    tier = "db-custom-2-7680"
  }
}

resource "google_artifact_registry_repository" "cloudshirt-repo" {
  location      = "europe-west1"
  repository_id = "cloudshirt-repo"
  description   = "cloudshirt-repo voor de cloudshirt website"
  format        = "DOCKER"
}
