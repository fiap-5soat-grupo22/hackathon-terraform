data "google_project" "default" {}

variable "company" {
  description = "company"
  type        = string
}

variable "project_id" {
  description = "project_id"
  type        = string
}

variable "project_number" {
  description = "project_number"
  type        = string
}
variable "shared_project_number" {
  description = "shared project number"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}