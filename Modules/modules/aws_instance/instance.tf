resource "aws_instance" "web" {
  ami                         = var.instance_info.ami
  instance_type               = var.instance_info.instance_type
  associate_public_ip_address = true
  key_name                    = var.instance_info.key_name
  subnet_id                   = data.aws_subnet.defaultsubnet.id
  vpc_security_group_ids      = ["sg-08b9457c462f1c483"]

  tags = {
    Name = var.instance_info.Name
  }
}