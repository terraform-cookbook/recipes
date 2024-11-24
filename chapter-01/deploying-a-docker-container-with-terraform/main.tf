#######################################################################
# title:    1.11 - Deploying a Docker Container with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-01/deploying-a-docker-container-with-terraform
#######################################################################

# see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "example" {
  name  = "example"
  image = "nginx"

  ports {
    internal = 80
    external = 8000
  }
}
