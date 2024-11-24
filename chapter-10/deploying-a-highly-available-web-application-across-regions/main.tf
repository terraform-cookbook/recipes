#######################################################################
# title:    10.2 - Deploying a Highly Available Web Application Across Regions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-10/deploying-a-highly-available-web-application-across-regions
#######################################################################

# Create a VPC in each region
module "vpc_east" {
  source = "./modules/vpc"

  providers = {
    aws = aws.us_east_1
  }

  cidr_block = "10.0.0.0/16"
  region     = "us-east-1"
}

module "vpc_west" {
  source = "./modules/vpc"

  providers = {
    aws = aws.us_west_2
  }

  cidr_block = "10.1.0.0/16"
  region     = "us-west-2"
}

# Create an Auto Scaling group in each region
module "asg_east" {
  source = "./modules/asg"

  providers = {
    aws = aws.us_east_1
  }

  vpc_id           = module.vpc_east.vpc_id
  subnet_ids       = module.vpc_east.public_subnet_ids
  min_size         = 2
  max_size         = 5
  desired_capacity = 2
  instance_type    = "t3.micro"
  app_name         = "example-app"
}

module "asg_west" {
  source = "./modules/asg"

  providers = {
    aws = aws.us_west_2
  }

  vpc_id           = module.vpc_west.vpc_id
  subnet_ids       = module.vpc_west.public_subnet_ids
  min_size         = 2
  max_size         = 5
  desired_capacity = 2
  instance_type    = "t3.micro"
  app_name         = "example-app"
}

# Create a global accelerator for high availability
resource "aws_globalaccelerator_accelerator" "example" {
  name            = "example-accelerator"
  ip_address_type = "IPV4"
  enabled         = true
}

# Create a listener for the global accelerator
resource "aws_globalaccelerator_listener" "example" {
  accelerator_arn = aws_globalaccelerator_accelerator.example.id
  client_affinity = "SOURCE_IP"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

# Attach regional load balancers to the global accelerator
resource "aws_globalaccelerator_endpoint_group" "example" {
  listener_arn = aws_globalaccelerator_listener.example.id

  endpoint_configuration {
    endpoint_id = module.asg_east.alb_arn
    weight      = 50
  }

  endpoint_configuration {
    endpoint_id = module.asg_west.alb_arn
    weight      = 50
  }
}
