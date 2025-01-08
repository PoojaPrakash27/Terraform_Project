output "ALB_DNS_Name" {
  description = "DNS name of the application load balancer created"
  value       = aws_lb.ALB.dns_name
}
