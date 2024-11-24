#######################################################################
# title:    8.8 - Utilizing Terraform Templates
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-08/utilizing-terraform-templates
#######################################################################

#cloud-config
hostname: ${hostname}
fqdn: ${hostname}.example.com
manage_etc_hosts: true
