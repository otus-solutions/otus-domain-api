###############################################
###               Variables                 ###
###############################################

variable "otus-domain-api-name" {
  default = "otus-domain-api"  
}
variable "otus-domain-api-directory" {
  default = "otus-domain-api"  
}
variable "otus-domain-api-source" {
  default = "/source/otus-domain-root"  
}

variable "otus-domain-api-mvnbuild" {
  default = "clean install"
  
}


###############################################
### OTUS-DOMAIN-API : Build Image Service ###
###############################################
resource "null_resource" "otus-domain-api-build" {
  provisioner "local-exec" {
    working_dir = "otus-domain-api/source/otus-domain-root"
    command = "mvn ${var.otus-domain-api-mvnbuild}"
  }
}
 
resource "null_resource" "otus-domain-api" {
  depends_on = [null_resource.otus-domain-api-build]
  provisioner "local-exec" {
    working_dir = "otus-domain-api"
    command = "docker build -t ${var.otus-domain-api-name} ."
  }
}