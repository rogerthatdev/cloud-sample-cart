variable "project_id" {
  type        = string
  description = "Google Cloud project ID."
}


variable "region" {
  type        = string
  description = "Default region to deploy resources to."
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default zone to deploy resources to."
  default     = "us-central1-b"
}