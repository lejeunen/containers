resource "aws_route_table" "application" {
  count = var.subnet_count
  vpc_id = aws_vpc.eks.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.*.id[count.index]
  }
  tags = {
    Name = "${var.cluster_name}_application"
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
    Name = "${var.cluster_name}_gateway"
    Env = var.env
  }
}

resource "aws_route_table_association" "application" {
  count = var.subnet_count
  subnet_id = aws_subnet.application.*.id[count.index]
  route_table_id = aws_route_table.application.*.id[count.index]
}

resource "aws_route_table_association" "gateway" {
  count = var.subnet_count
  subnet_id = aws_subnet.gateway.*.id[count.index]
  route_table_id = aws_route_table.gateway.id
}
