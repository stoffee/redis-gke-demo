provider "google" {
  region      = "${var.gcp_region}"
  credentials = "${var.gcp_credentials}"
}

terraform {
  required_version = ">= 0.11.0"
}



resource "google_redis_instance" "cache" {
  name           = "ha-memory-cache"
  tier           = "STANDARD_HA"
  memory_size_gb = 1

#  location_id             = "us-central1-a"
  location_id             = "${var.gcp_zone}"
  alternative_location_id = "${var.alternative_gcp_zone}"
  project       = "${var.gcp_project_id}"

  authorized_network = "${google_compute_network.auto-network.self_link}"

  redis_version     = "REDIS_3_2"
  display_name      = "${var.namespace}"
  reserved_ip_range = "192.168.0.0/29"

  labels = {
    Owner    = "cdunlap"
    TTL = "24hrs"
  }
}

resource "google_compute_network" "auto-network" {
  name = "authorized-network"
}
