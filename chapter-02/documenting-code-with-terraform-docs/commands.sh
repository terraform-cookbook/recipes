#######################################################################
# title:    2.7 - Documenting Code with terraform-docs
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/documenting-code-with-terraform-docs
#######################################################################

# initialize Terraform
terraform init

# generate Terraform Module Documentation in Markdown format
terraform-docs markdown ./ > README.md

# generate Terraform Module Documentation in JSON format
terraform-docs json ./ > docs.json

# generate Terraform Module Documentation in YAML format
terraform-docs yaml ./ > docs.yaml

# generate Terraform Module Documentation in ASCIIDoc format
terraform-docs asciidoc table ./ > docs.adoc
