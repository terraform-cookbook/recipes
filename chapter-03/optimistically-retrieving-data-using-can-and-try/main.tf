#######################################################################
# title:    3.11 - Optimistically Retrieving Data Using can and try
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/optimistically-retrieving-data-using-can-and-try
#######################################################################

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
