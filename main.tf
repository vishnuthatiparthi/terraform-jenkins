provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "demo" {
  ami           = "ami-08a6efd148b1f7504" 
  instance_type = "t2.micro"
  tags = {
    Name = "jenkins-instance"
  }
}

