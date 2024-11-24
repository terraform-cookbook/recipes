#######################################################################
# title:    2.6 - Validating Code with Open Policy Agent
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-02/validating-code-with-open-policy-agent
#######################################################################

# terraform.rego
package terraform

# Define a policy to restrict allowed EC2 instance types
deny["Instance type must be t2.micro or t2.small"] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  instance_type := resource.change.after.instance_type not instance_type == "t2.micro"
  not instance_type == "t2.small"
}

# Define a policy to enforce tagging for EC2 instances
deny["All EC2 instances must have a Name tag"] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  tags := resource.change.after.tags
  not tags.Name
}
