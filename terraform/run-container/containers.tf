variable "otus-domain-api-persistence"{
  default = "/otus-platform/docker-persistence/otus-domain-api"
}

variable "otus-domain-api-porthttp"{
  default = 51006
}

variable "otus-domain-api-portmanagement"{
  default = 51008
}

variable "otus-domain-api-version"{
  default = "latest"
}

resource "docker_image" "otus-domain-api" {
  name = "otus-domain-api:${var.otus-domain-api-version}"
}

resource "docker_container" "otus-domain-api" {
  name = "otus-domain-api"
  image = "${docker_image.otus-domain-api.name}"
  ports {
	internal = 8080
	external = "${var.otus-domain-api-porthttp}"
  }
  ports {
	internal = 9990
	external = "${var.otus-domain-api-portmanagement}"
  }
}
