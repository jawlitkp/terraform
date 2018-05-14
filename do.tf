// Configure the Google Cloud provider
provider "google" {
  #credentials = "${file("account.json")}"
  project     = "devops-terraform-demo"
  region      = "us-central1"
}

data "google_compute_zones" "available" {}
// Create a new instance
resource "google_compute_instance" "default" {
  # ...
  name = "tf-compute-2"
  machine_type = "f1-micro"
  zone = "${data.google_compute_zones.available.names[0]}"
  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20170328"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }

}
