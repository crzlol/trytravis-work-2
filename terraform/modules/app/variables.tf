variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable "zone" {
  description = "Zone"
  default     = "europe-north1-a"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable "db_internal_ip" {
  description = "Database ip address"
}

variable "env" {
  description = "Environement prod | stage | dev"
}

locals {
  Environ = "${var.env}"
}
