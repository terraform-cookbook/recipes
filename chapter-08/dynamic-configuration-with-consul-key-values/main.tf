#######################################################################
# title:    8.3 - Dynamic Configuration with Consul Key-Values
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/dynamic-configuration-with-consul-key-values
#######################################################################

data "consul_keys" "app" {
  key {
    name    = "port"
    path    = "app/config/port"
    default = "8080"
  }

  key {
    name    = "name"
    path    = "app/config/name"
    default = "my-app"
  }
}

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami = "ami-05d38da78ce859165"

  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "App Name: ${data.consul_keys.app.var.name}" > app_config.txt
              echo "App Port: ${data.consul_keys.app.var.port}" >> app_config.txt
              EOF

  tags = {
    Name = "example-instance"
  }
}
