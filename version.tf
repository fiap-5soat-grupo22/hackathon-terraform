terraform {
  required_version = "~>1.9.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.37.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "5.37.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}