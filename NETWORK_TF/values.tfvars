vpc_info = {
  Name       = "myvpc"
  cidr_range = "192.168.0.0/16"
}

subnet_info = {
  Name       = "mysubnet"
  cidr_range = "192.168.0.0/24"
}

igw_info = {
  Name = "myigw"
}

route_info = {
  Name = "myroute"
}

sg_info = {
  Name = "mysg"
}

instance_info = {
  Name              = "Madhuri"
  ami               = "ami-02eb7a4783e7e9317"
  availability_zone = "ap-south-1c"
  instance_type     = "t3.micro"
  key_name          = "key1"
}



