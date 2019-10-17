###############################################
###               Variables                 ###
###############################################

variable "otus-domain-api" {
  type = "map"
  default = {
    "name" = "otus-domain-api"
    "directory" = "otus-domain-api"
    "source" = "/source/otus-domain-root"
  }
}

###############################################
### OTUS-DOMAIN-API : Build Image Service ###
###############################################
resource "null_resource" "otus-domain-api" {
  provisioner "local-exec" {
    command = "cd ${var.otus-domain-api["directory"]}/${var.otus-domain-api["source"]} && mvn clean install"
  }
  provisioner "local-exec" {
    command = "sudo docker build -t ${var.otus-domain-api["name"]} ${var.otus-domain-api["directory"]}"
  }
}