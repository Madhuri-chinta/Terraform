provider "aws" {
  region = "ap-south-1"
}

module "aws_instance" {
  source = "./modules/aws_instance"
  region = "ap-south-1"
  instance_info = {
    Name          = "web"
    ami           = "ami-02eb7a4783e7e9317"
    instance_type = "t3.micro"
    key_name      = "import"
  }


}
output "web_ip" {
  value = module.aws_instance.web_ip
}