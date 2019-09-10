data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "gateway" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.10.0/24"
  vpc_id = aws_vpc.eks.id
  tags = {
    Name = "${var.env}_gateway"
    Env = var.env
  }
}

resource "aws_subnet" "application_dev" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.20.0/24"
  vpc_id = aws_vpc.eks.id
  tags = {
    Name = "${var.env}_application"
    Env = var.env
  }
}