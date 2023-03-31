resource "aws_vpc" "ntier" {
  cidr_block = var.vpcs_info.cidr_ranges[count.index]
  count      = 2

  tags = {
    Name = var.vpcs_info.names[count.index]
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.ntier[0].id
  cidr_block        = var.vpc1_subnet_info.cidr_ranges[count.index]
  availability_zone = "${var.vpcs_info.region}${var.vpc1_subnet_info.availability_zones[count.index]}"
  count             = 6

  tags = {
    Name = var.vpc1_subnet_info.names[count.index]
  }
  depends_on = [
    aws_vpc.ntier[0]
  ]
}

resource "aws_subnet" "master" {
  vpc_id            = aws_vpc.ntier[1].id
  cidr_block        = var.vpc2_subnet_info.cidr_ranges[count.index]
  availability_zone = "${var.vpcs_info.region}${var.vpc2_subnet_info.availability_zones[count.index]}"
  count             = 6

  tags = {
    Name = var.vpc2_subnet_info.names[count.index]
  }
  depends_on = [
    aws_vpc.ntier[1]
  ]
}


