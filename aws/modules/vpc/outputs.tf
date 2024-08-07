output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}

output "subnet2_ids"{
    value = aws_subnet.subnet[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}