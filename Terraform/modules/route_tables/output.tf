output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of the public route table"
}

output "public_route_table_association_ids" {
  value       = aws_route_table_association.public[*].id
  description = "List of public route table association IDs"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "ID of the private route table"
}

output "private_route_table_association_ids" {
  value       = aws_route_table_association.private[*].id
  description = "List of private route table association IDs"
}