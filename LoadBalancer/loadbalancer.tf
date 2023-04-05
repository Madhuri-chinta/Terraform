resource "aws_lb" "test" {
  name               = "myloadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.securitygroup.id]
  subnets            = [
    aws_subnet.subnets[0].id,
    aws_subnet.subnets[1].id
  ]
  
  enable_deletion_protection = false
  tags = {
    Environment = "sweety"
  }
}