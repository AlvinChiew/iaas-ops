# prod
output "prod_vpc_id" {
  value = aws_vpc.prod_alvinchiew.id
}

output "prod_sg_id" {
  value = aws_vpc.prod_alvinchiew.default_security_group_id
}

output "prod_subnet_a_id" {
  value = aws_subnet.prod_alvinchiew_a.id
}

output "prod_subnet_b_id" {
  value = aws_subnet.prod_alvinchiew_b.id
}

output "prod_subnet_c_id" {
  value = aws_subnet.prod_alvinchiew_c.id
}


# stag
output "stag_vpc_id" {
  value = aws_vpc.stag_alvinchiew.id
}

output "stag_sg_id" {
  value = aws_vpc.stag_alvinchiew.default_security_group_id
}

output "stag_subnet_a_id" {
  value = aws_subnet.stag_alvinchiew_a.id
}

output "stag_subnet_b_id" {
  value = aws_subnet.stag_alvinchiew_b.id
}

output "stag_subnet_c_id" {
  value = aws_subnet.stag_alvinchiew_c.id
}
