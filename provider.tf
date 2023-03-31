terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"


}

terraform {
  backend "s3" {
    bucket         = "mysweetymadhuribucket"
    dynamodb_table = "mysweetymadhuri"
    key            = "classes/BACKEND_TF"
    region = "ap-south-1"
  }
}