# Creates an IAM role named "S3_Access_Role" with a trust policy that allows EC2 instances to assume the role.

resource "aws_iam_role" "S3_Access_Role" {
  name = "S3_Access_Role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# This resource defines an IAM role policy named "S3_Access_Policy".
# The policy is attached to the IAM role specified by "aws_iam_role.S3_Access_Role.name".
# The policy grants the following permissions:
# - Allows listing all S3 buckets.
# - Allows listing, getting, and putting objects in the specified S3 bucket.
resource "aws_iam_role_policy" "S3_Access_Policy" {
  name = "S3_Access_Policy"
  role = aws_iam_role.S3_Access_Role.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "S3:ListAllMyBuckets"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = ["${aws_s3_bucket.bucket-1.arn}/*", "${aws_s3_bucket.bucket-1.arn}"]
      }
    ]
  })
}

# Creates an IAM instance profile named "EC2_instance_profile".
# This instance profile is associated with the IAM role "S3_Access_Role", which grants the necessary permissions for EC2 instances to access S3.
resource "aws_iam_instance_profile" "EC2_instance_profile" {
  name = "EC2_instance_profile"
  role = aws_iam_role.S3_Access_Role.name
}
