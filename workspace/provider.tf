terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    bucket         = "test-bucket-31st"
    dynamodb_table = "mysweetymadhuri"
    key            = "madhuri/hellotf"
    region         = "ap-south-1"
  }
}