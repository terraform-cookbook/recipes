#######################################################################
# title:    5.1 - Using Local Versus Remote Docker Images
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/using-local-versus-remote-docker-images
#######################################################################

# see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
# Use a remote Docker image
resource "docker_image" "remote_image" {
  name = "<REMOTE_IMAGE_NAME>:<TAG>"
}

resource "docker_container" "remote_container" {
  name  = "remote_container"
  image = docker_image.remote_image.latest
}

# Use a local Docker image
resource "docker_image" "local_image" {
  name         = "<LOCAL_IMAGE_NAME>:<TAG>"
  keep_locally = true
}

resource "docker_container" "local_container" {
  name  = "local_container"
  image = docker_image.local_image.latest
}
