output "public_ec2_ids" {
  value = aws_instance.public_ec2[*].id
  description = "List of public EC2 instance IDs"
}

output "public_ec2_public_ips" {
  value = aws_instance.public_ec2[*].public_ip
  description = "List of public IPs for public EC2 instances"
}

output "private_ec2_ids" {
  value = aws_instance.private_ec2[*].id
  description = "List of private EC2 instance IDs"
}

output "private_ec2_private_ips" {
  value = aws_instance.private_ec2[*].private_ip
  description = "List of private IPs for private EC2 instances"
}