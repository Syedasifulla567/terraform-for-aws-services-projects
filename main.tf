variable "aws_accounts" {
  description = "List of AWS account IDs"
  type        = list(string)
}

resource "aws_vpc" "vpc" {
  count       = length(var.aws_accounts)
  cidr_block  = "10.${count.index}.0.0/16"
  tags = {
    Name = "VPC-${var.aws_accounts[count.index]}"
  }
}

resource "aws_subnet" "public" {
  count             = length(var.aws_accounts)
  vpc_id            = aws_vpc.vpc[count.index].id
  cidr_block        = "10.${count.index}.0.0/24"
  availability_zone = "us-east-1a"  # Choose your desired AZ
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-${var.aws_accounts[count.index]}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.aws_accounts)
  vpc_id            = aws_vpc.vpc[count.index].id
  cidr_block        = "10.${count.index}.1.0/24"
  availability_zone = "us-east-1a"  # Choose your desired AZ
  tags = {
    Name = "Private-Subnet-${var.aws_accounts[count.index]}"
  }
}