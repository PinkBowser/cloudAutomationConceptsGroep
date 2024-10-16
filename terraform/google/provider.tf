provider "google" {
  project     = "saxionclouds"
  region      = "europe-west1"
  zone        = "europe-west1-b"
  credentials = file("./saxionclouds.json")
}