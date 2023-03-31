vpcs_info = {
  region      = "ap-south-1"
  cidr_ranges = ["192.168.0.0/16", "10.0.0.0/16"]
  names       = ["vpc1", "vpc2"]
}
vpc1_subnet_info = {
  availability_zones = ["a", "b", "c", "a", "b", "c"]
  cidr_ranges        = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24"]
  names              = ["subnet1", "subnet2", "subnet3", "subnet4", "subnet5", "subnet6"]
}
vpc2_subnet_info = {
  availability_zones = ["a", "b", "c", "a", "b", "c"]
  cidr_ranges        = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  names              = ["subnet1", "subnet2", "subnet3", "subnet4", "subnet5", "subnet6"]
}
