resource "aws_instance" "public_ec2" {
  count         = length(var.public_subnet_ids)
  ami           = data.aws_ami.amazon_linux.id 
  instance_type = "t2.micro"
  subnet_id      = var.public_subnet_ids[count.index]
  vpc_security_group_ids = [var.public_security_group_id]
  key_name = var.key_name 

  tags = {
    Name = "PublicEC2Instance"
  }
}

resource "aws_instance" "private_ec2" {
  count         = length(var.private_subnet_ids)
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id      = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.private_security_group_id]
  key_name = var.key_name

  tags = {
    Name = "PrivateEC2Instance"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}




