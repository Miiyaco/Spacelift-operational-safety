provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "demo"
}

resource "aws_s3_bucket" "data" {
  bucket_prefix = "orbit-labs-"

  tags = {
    name        = "Orbit Labs Storage"
    managedBy   = "Spacelift"
    environment = var.environment
    cost-center = "engineering"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket_prefix = "orbit-labs-logs-"

  tags = {
    name        = "Orbit Labs Logs"
    managedBy   = "Spacelift"
    environment = var.environment
    cost-center = "engineering"
  }
}

resource "aws_s3_bucket" "backups" {
  bucket_prefix = "orbit-labs-backups-"

  tags = {
    name        = "Orbit Labs Backups"
    managedBy   = "Spacelift"
    environment = var.environment
    cost-center = "engineering"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.data.id
}