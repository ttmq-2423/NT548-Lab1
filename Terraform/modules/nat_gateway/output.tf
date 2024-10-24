output "nat_gateway_id" {
  value       = aws_nat_gateway.gw.id
  description = "ID of the NAT Gateway"
}

output "nat_gateway_eip" {
  value       = aws_eip.nat.public_ip
  description = "Public IP of the NAT Gateway"
}

output "nat_gateway_allocation_id" {
  value       = aws_eip.nat.allocation_id
  description = "Allocation ID of the NAT Gateway"
}