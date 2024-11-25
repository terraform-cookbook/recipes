#######################################################################
# title:    8.1 - Writing Shell Scripts with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/writing-shell-scripts-with-terraform
#######################################################################

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami = "ami-05d38da78ce859165"

  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "example-instance"
  }
}
