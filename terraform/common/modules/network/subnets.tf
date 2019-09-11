data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "gateway" {
  count = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = "10.0.1${count.index}.0/24"
  vpc_id = aws_vpc.eks.id
  tags = {
    Name = "${var.env}_gateway"
    Env = var.env
  }
}

resource "aws_subnet" "application" {
  count = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = "10.0.2${count.index}.0/24"
  vpc_id = aws_vpc.eks.id

  tags = map(
     "Name", "${var.env}_application",
     "Env", var.env,
     "kubernetes.io/cluster/${var.env}_eks", "shared",
    )


}