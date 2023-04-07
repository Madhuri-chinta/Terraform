variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "instance_info" {
  type = object({
    instance_type = string
    key_name      = string
    Name          = string
    ami           = string
  })
  default = {
    Name          = "web"
    ami           = "ami-02eb7a4783e7e9317"
    instance_type = "t3.micro"
    key_name      = "import"
  }
}