terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {
}

resource "docker_image" "webapp" {
  name          = "webapp:latest"
  keep_locally  = true
}

resource "docker_container" "webapp" {
  image = docker_image.webapp.latest
  name  = "demo_webapp"
  ports {
    internal = 80
    external = 8080
  }
}

