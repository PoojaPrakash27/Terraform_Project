output "bucket-ARN" {
  description = "ARN of the bucket created"
  value       = aws_s3_bucket.bucket-1.arn
}
