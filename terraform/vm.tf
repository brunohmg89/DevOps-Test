module "gce-container" {
  source  = "terraform-google-modules/container-vm/google"
  version = "~> 3.0"

  cos_image_name = var.cos_image_name

  container = {
    image = "docker.io/USER_DOCKERHUB/IMAGE"
  }

  restart_policy = "Always"
}

resource "google_compute_instance" "instance" {
    name          = "NAME-INSTANCE"
    machine_type  = "MACHINE_TYPE"
    
    tags = ["TAG"]

    boot_disk {
    initialize_params {
      image = module.gce-container.source_image
      }
    }
    
    metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    }

    service_account {
    email = var.client_email
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

    network_interface {
      network = "default"
    access_config {
    }
    }
}