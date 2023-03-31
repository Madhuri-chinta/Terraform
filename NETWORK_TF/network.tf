resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_info.cidr_range

  tags = {
    Name = var.vpc_info.Name
  }
}
resource "aws_subnet" "subnet" {
  cidr_block = var.subnet_info.cidr_range
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = var.subnet_info.Name
  }
  depends_on = [
    aws_vpc.vpc
  ]

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_info.Name
  }
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.route_info.Name
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.routetable.id
}

resource "aws_security_group" "securitygroup" {
  name   = "devops"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_info.Name
  }
}