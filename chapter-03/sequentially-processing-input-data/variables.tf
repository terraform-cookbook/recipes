#######################################################################
# title:    3.12 - Sequentially Processing Input Data
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-03/sequentially-processing-input-data
#######################################################################

variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "Subnet CIDR Blocks"

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "app_names" {
  type = list(string)

  default = [
    "app1",
    "app2",
    "app3"
  ]
}

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
