#######################################################################
# title:    3.12 - Sequentially Processing Input Data
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/sequentially-processing-input-data
#######################################################################

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "available" {
  state = "available"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "example" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = {
    Name = "Subnet-${count.index + 1}"
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "example" {
  count = length(var.app_names)
  name  = "role-${var.app_names[count.index]}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile
resource "aws_iam_instance_profile" "example" {
  count = length(var.app_names)
  name  = "profile-${var.app_names[count.index]}"
  role  = aws_iam_role.example[count.index].name
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"

  dynamic "ingress" {
    for_each = var.security_rules

    content {
      type        = try(ingress.value.type, "ingress")
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = can(ingress.value.cidr_blocks) ? ingress.value.cidr_blocks : null
    }
  }
}


data "aws_ami" "example" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # Canonical
  owners = ["099720109477"]
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "example" {
  count                = length(var.app_names)
  ami                  = data.aws_ami.example.id
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.example[count.index].name

  vpc_security_group_ids = [
    aws_security_group.example.id
  ]

  tags = {
    Name = var.app_names[count.index]
  }

  depends_on = [aws_iam_role.example]
}
