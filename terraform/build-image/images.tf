###############################################
###               Variables                 ###
###############################################

variable "otus-domain-api-name" {
  default = "otus-domain-api"  
}

variable "otus-domain-api-dockerfile" {
  default = "."  
}

variable "otus-domain-api-source" {
  default = "source"  
}

variable "otus-domain-api-mvnbuild" {
  default = "mvn clean install"
}

###############################################
### OTUS-DOMAIN-API : Build Image Service ###
###############################################
resource "null_resource" "otus-domain-api-build" {
  provisioner "local-exec" {
    working_dir = "${var.otus-domain-api-source}/otus-domain-root"
    command = "${var.otus-domain-api-mvnbuild}"
  }
}
 
resource "null_resource" "otus-domain-api" {
  depends_on = [null_resource.otus-domain-api-build]
  provisioner "local-exec" {
    command = "docker build -t ${var.otus-domain-api-name} ${var.otus-domain-api-dockerfile}"
  }
}
