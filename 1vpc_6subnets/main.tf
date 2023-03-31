resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr-range

  tags = {
    "Name" = "vpc"
  }

}

resource "aws_subnet" "subnets" {
  count             = 6
  cidr_block        = var.subnet-cidr-ranges[count.index]
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}${var.subnet-zones[count.index]}"
  depends_on = [
    aws_vpc.main
  ]

  tags = {
    "Name" = var.subnet-names[count.index]
  }

}
