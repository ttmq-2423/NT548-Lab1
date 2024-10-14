output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}
output "vpc_id" {
  value = aws_vpc.main.id
}
output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}