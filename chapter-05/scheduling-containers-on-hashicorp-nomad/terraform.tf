#######################################################################
# title:    5.12 - Scheduling Containers on HashiCorp Nomad
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-hashicorp-nomad
#######################################################################

terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/nomad/latest
    nomad = {
      source  = "hashicorp/nomad"
      version = ">= 2.4.0, < 3.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_version
  required_version = ">= 1.9.0, < 2.0.0"
}
