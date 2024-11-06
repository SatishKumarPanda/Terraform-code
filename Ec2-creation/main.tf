terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "aws_instance" "myserver" {
  ami           = "ami-04a37924ffe27da53"
  instance_type = "t2.micro"

  tags = {
    Name = "SampleServer"
  }
}

