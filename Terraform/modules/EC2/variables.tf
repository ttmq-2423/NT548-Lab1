variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_security_group_id" {
  type = string
}

variable "private_security_group_id" {
  type = string
}


variable "key_name" {
  type = string
  description = "The name of the key pair to use for SSH access"
}
