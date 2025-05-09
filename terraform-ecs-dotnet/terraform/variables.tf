variable "vpc_id" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "db_password" {
  sensitive = true
}
variable "my_ip_cidr" {
  description = "Your IP address in CIDR format (e.g. 203.0.113.45/32)"
}
