  region = "ap-south-1" # Set your desired AWS region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "example" {
  ami           = "ami-08718895af4dfa033" # Specify an appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-03a3f218c8dfa99fb"

  tags = {
    Name = "ExampleInstance"
  }
}
