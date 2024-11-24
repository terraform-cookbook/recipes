#######################################################################
# title:    2.6 - Validating Code with Open Policy Agent
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/validating-code-with-open-policy-agent
#######################################################################

# initialize Terraform
terraform init

# render Terraform Execution Plan
terraform plan -out=tfplan

# transform Terraform Execution Plan into JSON
terraform show -json tfplan > tfplan.json

# evaluate Terraform Execution Plan using Open Policy Agent
opa eval --data terraform.rego --input tfplan.json "data.terraform.deny"
