variable "otus-domain-api" {
  type = "map"
  default = {
	"name" = "otus-domain-api"
	"persistence-directory" = "/home/drferreira/otus-platform/docker-persistence/otus-domain-api"
	"port_http" = 51006
	"port_management" = 51008
  }
}

resource "docker_image" "otus-domain-api" {
  name = "otus-domain-api:latest"
}

resource "docker_container" "otus-domain-api" {
  name = "otus-domain-api"
  image = "${docker_image.otus-domain-api.latest}"
  ports {
	internal = 8080
	external = "${var.otus-domain-api["port_http"]}"
  }
  ports {
	internal = 9990
	external = "${var.otus-domain-api["port_management"]}"
  }
}
