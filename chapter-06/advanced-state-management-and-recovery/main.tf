#######################################################################
# title:    6.10 - Advanced State Management and Recovery
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-06/advanced-state-management-and-recovery
#######################################################################

# Example resource to demonstrate state management
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
