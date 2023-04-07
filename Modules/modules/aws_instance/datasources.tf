data "aws_vpc" "default" {
  default = false
  id      = "vpc-063edbd6fbbd7bb91"
}
data "aws_subnet" "defaultsubnet" {
  id                = "subnet-0ad48db7ac6c442ab	"
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "ap-south-1b"
}
