#  Enable required services for this sample.
locals {
  services = [
    "run.googleapis.com",              # Cloud Run
    "artifactregistry.googleapis.com", # Artifact Registry
    "file.googleapis.com",             # Cloud Filestore
    "vpcaccess.googleapis.com"         # Serverless VPC access connector
  ]
}

resource "google_project_service" "required" {
  project  = var.project_id
  for_each = toset(local.services)
  service  = each.value
}

resource "google_artifact_registry_repository" "default" {
  project       = var.project_id
  location      = var.region
  repository_id = "rogerthat-run-filesystems"
  format        = "DOCKER"
}

resource "google_filestore_instance" "default" {
  project  = var.project_id
  name     = "rogerthat-filestore"
  location = var.zone
  tier     = "PREMIUM"

  file_shares {
    capacity_gb = 2660
    name        = "share1"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}

resource "google_vpc_access_connector" "connector" {
  project       = var.project_id
  name          = "run-filestore"
  ip_cidr_range = "10.8.0.0/28"
  region        = var.region
  network       = "default"
  machine_type  = "e2-micro"
}