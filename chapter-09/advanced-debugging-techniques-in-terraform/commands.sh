#######################################################################
# title:    9.10 - Advanced Debugging Techniques in Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/advanced-debugging-techniques-in-terraform
#######################################################################

# Enable Detailed Logging:
export TF_LOG=TRACE
export TF_LOG_PATH=./terraform.log

# State inspection:
terraform show
terraform state list
terraform state show aws_instance.example

# Plan analysis:
terraform plan -out=tfplan
terraform show -json tfplan | jq

# Targeted operations:
terraform plan -target=aws_instance.example
terraform apply -target=aws_instance.example

# Module inspection:
terraform state pull | jq '.resources[] | select(.module == "module.example")'

# Refresh state:
terraform refresh

# Console for expression testing:
terraform console
