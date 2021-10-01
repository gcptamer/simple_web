// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}"
 project     = "week01deploy"
 region      = "us-central1"
}

// Create a GCE instance
resource "google_compute_instance" "default" {
  name         = "terraform"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "Ubuntu/Ubuntu 18.04 LTS"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}