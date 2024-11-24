#######################################################################
# title:    2.5 - Validating Code with Preconditions and Postconditions
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/validating-code-with-preconditions-and-postconditions
#######################################################################

resource "aws_instance" "example" {
  ami           = "ami-05d38da78ce859165"
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }

  # Postcondition
  lifecycle {
    # see https://developer.hashicorp.com/terraform/language/expressions/custom-conditions#preconditions-and-postconditions
    postcondition {
      condition     = self.tags["Name"] == "example-instance"
      error_message = "The Name tag must be set to 'example-instance'."
    }
  }
}
