terraform {
  required_providers {
    docker = {
      source  = "aman/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  #  - name  = "tutorial"
  name = var.container_name
  ports = {
    internal = 80
    external = 8000
  }
}

variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}
