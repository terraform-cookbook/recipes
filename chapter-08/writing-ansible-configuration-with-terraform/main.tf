#######################################################################
# title:    8.2 - Writing Ansible Configuration with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/writing-ansible-configuration-with-terraform
#######################################################################

resource "aws_instance" "example" {
  # Ubuntu 24.04, see https://cloud-images.ubuntu.com/locator/ec2/
  ami = "ami-05d38da78ce859165"

  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y ansible
              echo "${file("ansible.cfg")}" > /etc/ansible/ansible.cfg
              echo "${file("hosts")}" > /etc/ansible/hosts
              EOF

  tags = {
    Name = "example-instance"
  }
}
