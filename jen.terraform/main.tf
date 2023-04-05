resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_info.cidr_block

  tags = {
    Name = var.vpc_info.Name
  }
}
resource "aws_subnet" "subnets" {
  cidr_block = var.subnets_info.cidr_block[count.index]
  vpc_id     = aws_vpc.vpc.id
  count      = length(var.subnets_info.Names)
  tags = {
    Name = var.subnets_info.Names[count.index]
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
    tags = {
    Name = "route"
  }
}
resource "aws_route_table_association" "routeassociate" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.route.id
}
resource "aws_security_group" "security" {
  name        = "security"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  tags = {
    Name = "security"
  }
}
resource "aws_instance" "instance" {
  count = length(var.instance_info.Names)
  ami           = var.instance_info.ami
  instance_type = var.instance_info.instance_type
  associate_public_ip_address = true
  key_name = var.instance_info.key
  subnet_id = aws_subnet.subnets[0].id
  vpc_security_group_ids = [ aws_security_group.security.id ]
  tags = {
    Name = var.instance_info.Names[count.index]
  }
  user_data                   = file("nginx.sh")
}
