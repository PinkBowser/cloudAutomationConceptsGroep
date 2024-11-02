resource "google_compute_network" "cloudshirt-VPC" {
  name = "cloudshirt-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks = true
  routing_mode = "GLOBAL"
}
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.autopilot.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.autopilot.master_auth[0].cluster_ca_certificate)
}

resource "google_container_cluster" "autopilot" {
   name = "autopilot-cluster-cloudshirt"
   enable_autopilot = true
   deletion_protection = false
   network = google_compute_network.cloudshirt-VPC.id

 }

resource "kubernetes_deployment_v1" "Nginx" {
  depends_on = [ google_container_cluster.autopilot ]
metadata {
      name = "nginx"
}

spec {
  replicas = 5
selector {
   match_labels = { 
    app = "nginx" 
    }
}
template {
  metadata {
    labels = {app = "nginx" }

  }
  spec {
    container {
      name = "nginx"
      image = "nginx:1.19.9-alpine"
    }
  }
}
}
}

# resource "google_sql_database_instance" "autopilot-cloudshirt-database" {
#   depends_on = [ google_compute_global_address.cloudsql_address ]
#   name             = "autopilot-cloudshirt-database"
#   database_version = "SQLSERVER_2019_EXPRESS"
#   root_password = "CloudShirt123"
#   deletion_protection = false
#   region = "europe-west1"

#   settings {
#   tier = "db-custom-2-7680"

#   ip_configuration {
#   private_network = google_compute_network.cloudshirt-VPC.id
#       }
        
#   }
# }

# resource "google_artifact_registry_repository" "cloudshirt-repo" {
#   location      = "europe-west1"
#   repository_id = "cloudshirt-repo"
#   description   = "cloudshirt-repo voor de cloudshirt website"
#   format        = "DOCKER"
# }
