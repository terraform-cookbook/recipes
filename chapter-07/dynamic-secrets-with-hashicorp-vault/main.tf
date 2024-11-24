#######################################################################
# title:    7.9 - Dynamic Secrets with HashiCorp Vault
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-07/dynamic-secrets-with-hashicorp-vault
#######################################################################

# Enable and configure a dynamic secret engine in Vault
resource "vault_mount" "db" {
  path = "database"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mysql" {
  backend       = vault_mount.db.path
  name          = "mysql"
  allowed_roles = ["app"]

  mysql {
    connection_url = "{{username}}:{{password}}@tcp(mysql.example.com:3306)/"
  }
}

resource "vault_database_secret_backend_role" "app" {
  backend     = vault_mount.db.path
  name        = "app"
  db_name     = vault_database_secret_backend_connection.mysql.name
  default_ttl = "1h"
  max_ttl     = "24h"

  creation_statements = [
    "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
    "GRANT SELECT ON *.* TO '{{name}}'@'%';",
  ]
}

# Generate dynamic credentials
data "vault_database_secret_backend_creds" "creds" {
  backend = vault_mount.db.path
  role    = vault_database_secret_backend_role.app.name
}

# Use the dynamic credentials
resource "mysql_database" "app" {
  name     = "app_db"
  user     = data.vault_database_secret_backend_creds.creds.username
  password = data.vault_database_secret_backend_creds.creds.password
}
