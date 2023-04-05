resource "aws_instance" "instance" {
  ami                         = var.instance_info.ami
  associate_public_ip_address = true
  instance_type               = var.instance_info.instance_type
  key_name                    = var.instance_info.key_name
  vpc_security_group_ids      = [aws_security_group.securitygroup.id]
  subnet_id                   = aws_subnet.subnet.id
  tags = {
    Name = var.instance_info.Name
  }
}
