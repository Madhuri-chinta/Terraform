vpc_info = {
  Name       = "vpc"
  cidr_block = "10.0.0.0/16"
}
subnets_info = {
  Names      = ["subnet1", "subnet2", "subnet3", "subnet4"]
  cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
instance_info = {
  Names         = ["instance1", "instance2"]
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t3.micro"
  key           = "key1"
}
rollout_version = "0.0.0.0"