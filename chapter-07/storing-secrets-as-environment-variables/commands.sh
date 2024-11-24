#######################################################################
# title:    7.5 - Storing Secrets as Environment Variables
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/storing-secrets-as-environment-variables
#######################################################################

# Set the secrets as environment variables in your shell or CI/CD pipeline:
export TF_VAR_database_password="your_database_password"
export TF_VAR_api_key="your_api_key"
