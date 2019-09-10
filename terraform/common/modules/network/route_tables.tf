resource "aws_route_table" "application" {
  vpc_id = aws_vpc.eks.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }
  tags = {
    Name = "${var.env}_application"
    Env = var.env
  }
}

resource "aws_route_table" "gateway" {
  vpc_id = aws_vpc.eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${var.env}_gateway"
    Env = var.env
  }
}

resource "aws_route_table_association" "application" {

  subnet_id = aws_subnet.application_dev.id
  route_table_id = aws_route_table.application.id
}

resource "aws_route_table_association" "gateway" {

  subnet_id = aws_subnet.gateway.id
  route_table_id = aws_route_table.gateway.id
}
