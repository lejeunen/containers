output "vpc_id" {
  value = aws_vpc.eks.id
}

output "app_subnet_ids" {
  value = aws_subnet.application.*.id
}
output "gateway_subnet_ids" {
  value = aws_subnet.gateway.*.id
}