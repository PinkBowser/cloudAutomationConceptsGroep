provider "aws" {
  region = "us-east-1"
}

provider "google" {
  project     = "saxionclouds"
  region      = "europe-north1"
  zone = "europe-north1-a"
  credentials = file("C:/Users/Lucas/google/saxionclouds-ab524f132ccb.json")
}