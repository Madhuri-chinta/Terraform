variable "vpc_info" {
  type = object({
    cidr_range = string
    Name       = string
  })
}

variable "subnet_info" {
  type = object({
    cidr_range = string
    Name       = string
  })
}

variable "igw_info" {
  type = object({
    Name = string
  })
}

variable "route_info" {
  type = object({
    Name = string
  })
}

variable "sg_info" {
  type = object({
    Name = string
  })
}

variable "instance_info" {
  type = object({
    ami               = string
    instance_type     = string
    availability_zone = string
    key_name          = string
    Name              = string
  })
}