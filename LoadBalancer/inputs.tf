variable "region" {
  type = string
}
variable "subnets_info" {
  type = object({
    cidr_ranges = list(string)
    Names       = list(string)
  })
}