terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0705384c0b33c194c"
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
