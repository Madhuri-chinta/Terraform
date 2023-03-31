variable "region" {
  type    = string
  
}

variable "vpc-cidr-range" {
  type    = string


}

variable "subnet-cidr-ranges" {
  type    = list(string)
  

}

variable "subnet-zones" {
  type    = list(string)
  

}

variable "subnet-names" {
  type    = list(string)
  

}











variable "names" {
  type = object({
    resource_group = string
    vnet           = string
  })
  default = {
    resource_group = "ntier-rg"
    vnet           = "ntier-vnet"
  }
}