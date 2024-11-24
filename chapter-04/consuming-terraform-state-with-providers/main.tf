#######################################################################
# title:    4.10 - Consuming Terraform State with Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/consuming-terraform-state-with-providers
#######################################################################

# Data source to access the remote state
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state-bucket"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}

# Example resource using data from the remote state
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.network.outputs.subnet_id

  tags = {
    Name = "AppServerInstance"
  }
}
