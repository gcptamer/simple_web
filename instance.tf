// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}"
 project     = "trusty-magnet-327716"
 region      = "us-central1"
}

// Create a GCE instance
resource "google_compute_instance" "default" {
  name         = "terraform"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}