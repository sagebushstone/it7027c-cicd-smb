terraform {
    required_providers {
        docker = { source = "kreuzwerker/docker" }
    }
}

provider "docker" { host = "unix:///var/run/docker.sock" }


resource "docker_image" "nginx" {
    name = "nginxdemos/hello:latest"
}

resource "docker_container" "nginx1" {
    name = "nginx1"
    image = docker_image.nginx.image_id
}