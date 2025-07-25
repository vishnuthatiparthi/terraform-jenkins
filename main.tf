provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-0c1a7f89451184c8b" # Amazon Linux 2 in Mumbai
  instance_type = "t2.micro"
  tags = {
    Name = "jenkins-instance"
  }
}
