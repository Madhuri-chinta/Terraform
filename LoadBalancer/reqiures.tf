resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.vpc.id
  count      = 2
  cidr_block = var.subnets_info.cidr_ranges[count.index]
  depends_on = [
    aws_vpc.vpc
  ]
  tags = {
    Name = var.subnets_info.Names[count.index]
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "myroute"
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.routetable.id
}


resource "aws_security_group" "securitygroup" {
  name   = "MYsg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  depends_on = [
    aws_vpc.vpc
  ]

  tags = {
    Name = "securitygroup"
  }
}

resource "aws_instance" "nginx" {
  ami                         = "ami-02eb7a4783e7e9317"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "import"
  subnet_id                   = aws_subnet.subnets[0].id
  vpc_security_group_ids      = [aws_security_group.securitygroup.id]
  user_data                   = file("nginx.sh")
  tags = {
    Name = "instance"
  }
  
}

resource "aws_lb_target_group" "target" {
  name     = "mytarget"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "targetinstance" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.nginx.id
  port             = 80
}