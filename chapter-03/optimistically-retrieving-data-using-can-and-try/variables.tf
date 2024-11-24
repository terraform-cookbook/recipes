#######################################################################
# title:    3.11 - Optimistically Retrieving Data Using can and try
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/optimistically-retrieving-data-using-can-and-try
#######################################################################

variable "security_rules" {
  type = map(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  description = "Security Rules"

  default = {
    http = {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },

    https = {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

# advanced example
variable "advanced_security_rules" {
  type = map(object({
    type        = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
    description = optional(string)
  }))

  default = {
    http = {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
    },

    https = {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS traffic"
    }
  }
}

locals {
  processed_rules = {
    for key, rule in var.advanced_security_rules :
    key => {
      type        = try(rule.type, "ingress")
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = can(rule.cidr_blocks) ? rule.cidr_blocks : ["0.0.0.0/0"]
      description = try(rule.description, "Managed by Terraform")
    }
  }
}
