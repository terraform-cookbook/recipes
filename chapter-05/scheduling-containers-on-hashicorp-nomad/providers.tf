#######################################################################
# title:    5.12 - Scheduling Containers on HashiCorp Nomad
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-hashicorp-nomad
#######################################################################

provider "nomad" {
  address = "http://127.0.0.1:4646"
}
