variable "project" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
  default     = "europe-north1"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "disk_image" {
  description = "Disk image"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable "zone" {
  description = "Zone"
  default     = "europe-north1-a"
}

variable "number" {
  description = "Count of virtual mashines"
  default     = 1
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
}
