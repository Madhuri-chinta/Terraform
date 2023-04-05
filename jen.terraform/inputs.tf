variable "vpc_info" {
  type = object({
    cidr_block = string
    Name       = string
  })
}
variable "subnets_info" {
  type = object({
    cidr_block = list(string)
    Names      = list(string)
  })
}
variable "instance_info" {
  type = object({
    ami = string
    Names      = list(string)
    instance_type = string
    key = string
    
  })
}


