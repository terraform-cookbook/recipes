#######################################################################
# title:    7.6 - Auditing and Rotating Secrets
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/auditing-and-rotating-secrets
#######################################################################

# Enable audit logging in Vault (typically done outside of Terraform)
vault \
  audit \
    enable \
      file file_path="/var/log/vault_audit.log"
