variable "name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type    = list(string)
}

variable "private_subnets" {
  type    = list(string)
}

variable "availability_zone" {
  type    = list(string)
}