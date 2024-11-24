#######################################################################
# title:    8.6 - Importing Existing Infrastructure into Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/importing-existing-infrastructure-into-terraform
#######################################################################

terraform init

terraform \
  plan \
    -generate-config-out=generated_resources.tf
