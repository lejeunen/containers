resource "aws_vpc" "eks" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "${var.env}_eks"
    Env = var.env
  }
}