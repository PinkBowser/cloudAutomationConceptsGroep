# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_id" {
  description = "project id"
  default = "saxionclouds"
}

variable "region" {
  description = "region"
  default = "europe-north1"
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("C:/Users/Lucas/google/saxionclouds-ab524f132ccb.json")
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
