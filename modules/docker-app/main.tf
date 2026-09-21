terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.5.0"
    }
  }
  required_version = "~> 1.15.8"
}

resource "docker_image" "app" {
  name = var.image
}

resource "docker_container" "app" {
  name  = var.app_name
  image = docker_image.app.image_id
  ports {
    internal = var.ports
    external = var.ports
  }

  networks_advanced {
    name = var.network_name
  }
}