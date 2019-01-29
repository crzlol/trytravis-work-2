variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "zone" {
  description = "Zone"
  default     = "europe-north1-a"
}

variable "number" {
  description = "Count of docker-hosts"
  default     = 1
}

variable "disk_image" {
  description = "Disk image for reddit app"
  default     = "ubuntu-1604-lts"
}
