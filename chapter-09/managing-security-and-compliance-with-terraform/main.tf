#######################################################################
# title:    9.9 - Managing Security and Compliance with Terraform
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-09/managing-security-and-compliance-with-terraform
#######################################################################

# Set up AWS Config
resource "aws_config_configuration_recorder" "main" {
  name     = "config-recorder"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "main" {
  name           = "config-delivery-channel"
  s3_bucket_name = aws_s3_bucket.config_logs.id
  sns_topic_arn  = aws_sns_topic.config_updates.arn

  depends_on = [aws_config_configuration_recorder.main]
}

# AWS Config Rules
resource "aws_config_config_rule" "s3_bucket_public_read_prohibited" {
  name = "s3-bucket-public-read-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }
}

resource "aws_config_config_rule" "ec2_encrypted_volumes" {
  name = "ec2-encrypted-volumes"

  source {
    owner             = "AWS"
    source_identifier = "ENCRYPTED_VOLUMES"
  }
}

# IAM Role for AWS Config
resource "aws_iam_role" "config_role" {
  name = "aws-config-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "config_policy" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

# S3 Bucket for Config Logs
resource "aws_s3_bucket" "config_logs" {
  bucket = "my-config-logs-bucket"
}

resource "aws_s3_bucket_policy" "config_logs" {
  bucket = aws_s3_bucket.config_logs.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowConfigWriteAccess"
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
        Action = [
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.config_logs.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

# SNS Topic for Config Updates
resource "aws_sns_topic" "config_updates" {
  name = "config-updates-topic"
}

# Example of integrating OPA with Terraform using null_resource
resource "null_resource" "opa_check" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "opa eval --data policy.rego --input terraform.tfplan 'data.terraform.analysis.score'"
  }
}
