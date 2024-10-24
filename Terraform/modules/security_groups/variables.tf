variable "vpc_id" {
  type = string
}

variable "my_ip" {
  type    = string
}
variable "public_subnets" {
  type    = list(string)
}
