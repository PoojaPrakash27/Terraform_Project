output "SG-SSH-id" {
  description = "ID of the Security Group that allows SSH access"
  value       = aws_security_group.SSH_Access.id
}

output "SG-HTTP-id" {
  description = "ID of the Security Group that allows HTTP access"
  value       = aws_security_group.HTTP_Access.id
}
