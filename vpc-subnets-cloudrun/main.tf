# main.tf
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  count                     = length(var.subnet_cidrs)
  name                      = "${var.vpc_name}-subnet-${count.index}"
  ip_cidr_range             = var.subnet_cidrs[count.index]
  network                   = google_compute_network.vpc_network.id
  region                    = var.region
}

resource "google_vpc_access_connector" "vpc_connector" {
  name         = var.vpc_connector_name
  network      = google_compute_network.vpc_network.name
  region       = var.region
  ip_cidr_range = var.vpc_connector_ip_cidr_range
}

resource "google_cloud_run_v2_service" "cloud_run_service" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    containers {
      image = var.cloud_run_image
      resources {
        limits = {
          memory = var.cloud_run_memory
        }
      }
    }
    vpc_access {
      connector = google_vpc_access_connector.vpc_connector.id
      egress    = "ALL_TRAFFIC"
    }
  }
}

data "google_cloud_run_service" "cloud_run_service" {
  name     = google_cloud_run_v2_service.cloud_run_service.name
  location = var.region
}
