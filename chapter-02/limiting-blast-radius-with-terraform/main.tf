#######################################################################
# title:    2.11 - Limiting Blast Radius with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/limiting-blast-radius-with-terraform
#######################################################################

module "networking" {
  # sample module, not included as part of this recipe
  source = "./modules/networking"
  # ... module parameters ...
}

module "compute" {
  # sample module, not included as part of this recipe
  source = "./modules/compute"
  # ... module parameters ...
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "example" {
  name = "limited-s3-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "feature_x" {
  count = var.enable_feature_x ? 1 : 0

  # ... instance configuration ...
}
