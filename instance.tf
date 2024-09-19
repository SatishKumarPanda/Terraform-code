provider "aws" {
  profile    = "terraform_user"
  access_key = ""  # Note: Avoid hardcoding sensitive info in your code
  secret_key = ""  # Consider using environment variables or AWS credentials file
  region     = "ap-south-1"
}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow RDP traffic"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform" {
  ami           = "ami-053284fc22a2c3f82"
  instance_type = "t2.micro"
  key_name      = "All keypair"
  subnet_id     = "subnet-03a3f218c8dfa99fb"

  vpc_security_group_ids = [aws_security_group.allow_rdp.id]  # Use vpc_security_group_ids instead of security_groups

  tags = {
    Name = "TerraformInstance"
  }
}
