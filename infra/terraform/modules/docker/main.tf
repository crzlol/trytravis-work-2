resource "google_compute_instance" "docker" {
  name         = "docker-host-${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  tags         = ["docker-host"]
  count        = "${var.number}"

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"
    access_config = {}
  }

  metadata {
    ssh-keys = "docker-user:${file(var.public_key_path)}"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"

    ports = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-host"]
}

resource "google_compute_firewall" "firewall_docker" {
  name    = "default-allow-docker"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["2375"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-host"]
}
