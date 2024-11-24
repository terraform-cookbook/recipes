#######################################################################
# title:    5.12 - Scheduling Containers on HashiCorp Nomad
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-hashicorp-nomad
#######################################################################

# see https://registry.terraform.io/providers/hashicorp/nomad/latest/docs/resources/job
resource "nomad_job" "redis" {
  jobspec = file("${path.module}/redis.nomad")
}
