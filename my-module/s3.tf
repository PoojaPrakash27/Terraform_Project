# This resource block defines an AWS S3 bucket.

resource "aws_s3_bucket" "bucket-2" {
  bucket = var.bucket_name
}

# This resource uploads a first application file to the S3 bucket.
# - depends_on: Specifies that this resource depends on the `aws_s3_bucket.bucket-1` resource, ensuring that the bucket is created before the file is uploaded.

resource "aws_s3_object" "app1_upload" {
  bucket = var.bucket_name
  key    = "app1.py"
  source = var.app1_path

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag       = filemd5(var.app1_path)
  depends_on = [aws_s3_bucket.bucket-2]
}

# This resource uploads a second application file to the S3 bucket.
# - depends_on: Specifies that this resource depends on the `aws_s3_bucket.bucket-1` resource, ensuring that the bucket is created before the file is uploaded.

resource "aws_s3_object" "app2_upload" {
  bucket = var.bucket_name
  key    = "app2.py"
  source = var.app2_path

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag       = filemd5(var.app2_path)
  depends_on = [aws_s3_bucket.bucket-2]
}
