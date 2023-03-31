variable "vpcs_info" {
  type = object({
    region      = string
    cidr_ranges = list(string)
    names       = list(string)
  })

}

variable "vpc1_subnet_info" {
  type = object({
    cidr_ranges        = list(string)
    names              = list(string)
    availability_zones = list(string)
  })

}

variable "vpc2_subnet_info" {
  type = object({
    cidr_ranges        = list(string)
    names              = list(string)
    availability_zones = list(string)
  })

}