resource "google_compute_instance_group" "puma-servers" {
  name = "puma-webservers"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  named_port {
    name = "puma"
    port = "9292"
  }

  zone = "europe-north1-a"
}

resource "google_compute_backend_service" "default" {
  name        = "my-backend"
  description = "Our company website"
  port_name   = "puma"
  protocol    = "HTTP"
  timeout_sec = 10
  enable_cdn  = false

  backend {
    group = "${google_compute_instance_group.puma-servers.self_link}"
  }

  health_checks = ["${google_compute_http_health_check.default.self_link}"]
}

resource "google_compute_http_health_check" "default" {
  name               = "test"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
  port               = "9292"
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "puma-forwarding-rule"
  port_range = "80"
  target     = "${google_compute_target_http_proxy.default.self_link}"
}

resource "google_compute_target_http_proxy" "default" {
  name    = "test-proxy"
  url_map = "${google_compute_url_map.default.self_link}"
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = "${google_compute_backend_service.default.self_link}"
}
