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

variable "zone" {
  description = "Zone"
  default     = "europe-north1-a"
}

variable "number" {
  description = "Count of virtual mashines"
  default     = 1
}

variable "env" {
  description = "Environement prod | stage"
  default     = "stage"
}
