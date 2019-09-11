resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "${var.env}_igw"
    Env = var.env
  }
}


resource "aws_eip" "this" {
  count = var.subnet_count
  vpc = true
  tags = {
    Name = "${var.env}_nat_gateway"
    Env = var.env
  }
}

resource "aws_nat_gateway" "this" {
  count = var.subnet_count
  allocation_id = aws_eip.this.*.id[count.index]
  subnet_id = aws_subnet.gateway.*.id[count.index]
  tags = {
    Name = "${var.env}_nat_gateway"
    Env = var.env
  }
  depends_on = [
    "aws_internet_gateway.this"]
}