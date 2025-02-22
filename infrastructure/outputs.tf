output "bucket_name" {
    value       = aws_s3_bucket.name.id
    description = "Bucket Name"
}

output "bucket_arn" {
    value       = aws_s3_bucket.name.arn
    description = "Arn identifier for s3 bucket on AWS"
}