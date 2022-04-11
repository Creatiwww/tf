output "aws_vpc_id" {
  value = aws_vpc.main.id
}

output "aws_route_table_id" {
  value = aws_route_table.Public-Subnet-RT.id
}
