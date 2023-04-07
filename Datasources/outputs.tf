output "vpc_id" {
  value = data.aws_vpc.default.id
}
output "web_ip" {
  value = aws_instance.web.public_ip
}

