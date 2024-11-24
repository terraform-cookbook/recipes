#######################################################################
# title:    4.5 - Creating a Terraform Module
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/creating-a-terraform-module
#######################################################################

variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The Name tag for the EC2 instance"
  type        = string
}
