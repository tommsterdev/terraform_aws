output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "publlic_subnet2_ids" {
  value = aws_subnet.public_subnet2[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}