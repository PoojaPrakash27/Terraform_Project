output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.S3_Access_Role.name

}

output "EC2_instance_profile" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.EC2_instance_profile.name
}
