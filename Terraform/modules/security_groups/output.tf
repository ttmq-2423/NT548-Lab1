output "aws_security_groups_public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "aws_security_groups_private_sg_id" {
  value = aws_security_group.private_sg.id
}

