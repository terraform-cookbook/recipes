#######################################################################
# title:    5.12 - Scheduling Containers on HashiCorp Nomad
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-05/scheduling-containers-on-hashicorp-nomad
#######################################################################

job "redis" {

  group "cache" {
    network {
      port "db" {}
    }

    task "redis" {
      driver = "docker"

      config {
        image   = "redis:7"
        ports   = ["db"]
        command = "/bin/sh"
        args    = ["-c", "redis-server --port ${NOMAD_PORT_db} & /local/db_log.sh"]
      }

      template {
        data        = <<EOF
          #!/bin/sh
          while true; do
            echo "$(date): Current DB Size: $(redis-cli -p ${NOMAD_PORT_db} DBSIZE)"
            sleep 3
          done
EOF
        destination = "local/db_log.sh"
        perms       = "0755"
      }

      resources {
        cpu    = 128
        memory = 128
      }

      service {
        name     = "redis-service"
        port     = "db"
        provider = "nomad"

        check {
          name     = "alive"
          type     = "tcp"
          port     = "db"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
