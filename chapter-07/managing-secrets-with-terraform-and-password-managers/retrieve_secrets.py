#######################################################################
# title:    7.7 - Managing Secrets with Terraform and Password Managers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/managing-secrets-with-terraform-and-password-managers
#######################################################################

#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import subprocess

def retrieve_secrets():
  # Example using 1Password CLI
  password = subprocess.check_output(['op', 'get', 'item',
                                      'database_password']).decode().strip()

  return {'database_password': password}

print(json.dumps(retrieve_secrets()))
