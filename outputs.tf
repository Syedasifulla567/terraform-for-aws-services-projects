output "vpc_id" {
  value = aws_vpc.vpc[0].id  # Access the attribute of the first instance
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id  # Access attributes of all instances
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id  # Access attributes of all instances
}
