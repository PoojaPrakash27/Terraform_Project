output "route_table_id" {
  description = "ID of the route table with internt access"
  value       = aws_route_table.route_table.id
}
