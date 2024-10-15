resource "aws_security_group" "public_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Security Group"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "allow_ssh_from_public"
  description = "Allow SSH inbound traffic from public subnet"
  vpc_id      = var.vpc_id


  ingress {
    description      = "SSH from Public Subnet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [aws_security_group.public_sg.id] 
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Private Security Group"
  }
}

variable "vpc_id" {
  type = string
}

variable "my_ip" {
  type    = string
  default = "0.0.0.0/0" 
}

