resource "aws_s3_bucket" "name" {
    bucket = var.bucket_name

    tags = {
        ManagedBy = "Terraform"
    }
}

resource "aws_s3_bucket_lifecycle_configuration" "name" {
    bucket = var.bucket_name

    rule {
        id = "object-ttl-1-month"

        expiration {
            days = 30
        }

        filter { }

        status = "Enabled"
    }
}