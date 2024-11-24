#######################################################################
# title:    6.8 - Managing Costs with HCP Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/managing-costs-with-hcp-terraform
#######################################################################

data "tfe_organization" "main" {
  name = "terraform-cookbook"
}

resource "tfe_workspace" "example" {
  name         = "my-workspace"
  organization = data.tfe_organization.main.name

  tag_names = [
  "example"]
}

# Set up a notification for cost alerts
resource "tfe_notification_configuration" "cost_alert" {
  name             = "Cost Alert"
  destination_type = "email"

  email_user_ids = [
    "user1",
    "user2"
  ]

  triggers = [
    "cost_estimation_completed"
  ]

  workspace_id = tfe_workspace.example.id
}

# Use Terraform modules to standardize resource configurations
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = "cost-optimized-instance"

  instance_type          = "t3.micro"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Environment = "dev"
    Project     = "cost-optimization"
  }
}
