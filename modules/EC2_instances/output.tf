output "instance_ID" {
  description = "ID of the EC2 instance created"
  value       = aws_instance.webserver.id
}

output "instance_public_IP" {
  description = "Public IP address of the EC2 instance created"
  value       = aws_instance.webserver.public_ip
}


