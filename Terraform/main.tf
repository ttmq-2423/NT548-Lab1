terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" 
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  name = "my-vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
  availability_zone = ["us-east-1a", "us-east-1b"]
}

# NAT Gateway Module
module "nat_gateway" {
  source = "./modules/nat_gateway"
  public_subnet_id = module.vpc.public_subnet_ids[0]
}

# Route Tables Module
module "route_tables" {
  source = "./modules/route_tables"
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "EC2" {
  source = "./modules/EC2"
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
 public_security_group_id = module.security_groups.aws_security_groups_public_sg_id
  private_security_group_id = module.security_groups.aws_security_groups_private_sg_id
  key_name = "lab_1" 
}



module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  my_ip = "171.253.26.100/32" 
}



# Outputs vpc
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

# Outputs route table
output "public_route_table_id" {
  value       = module.route_tables.public_route_table_id
}

output "public_route_table_association_ids" {
  value       = module.route_tables.public_route_table_association_ids
}

output "private_route_table_id" {
  value       = module.route_tables.private_route_table_id
}

output "private_route_table_association_ids" {
  value       = module.route_tables.private_route_table_association_ids
}

# Output nat gateway

output "nat_gateway_id" {
  value       = module.nat_gateway.nat_gateway_id 
}

output "nat_gateway_eip" {
  value       = module.nat_gateway.nat_gateway_eip 
}

output "nat_gateway_allocation_id" {
  value = module.nat_gateway.nat_gateway_allocation_id 
}

# Outputs EC2
output "public_ec2_ids" {
  value = module.EC2.public_ec2_ids
}

output "public_ec2_public_ips" {
  value = module.EC2.public_ec2_public_ips
}

output "private_ec2_ids" {
  value  = module.EC2.private_ec2_ids
}

output "private_ec2_private_ips" {
  value  = module.EC2.private_ec2_private_ips
}

# Output aws security groups
output "aws_security_groups_public_sg_id" {
  value = module.security_groups.aws_security_groups_public_sg_id
}

output "aws_security_groups_private_sg_id" {
  value = module.security_groups.aws_security_groups_private_sg_id
}

