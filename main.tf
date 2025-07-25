provider "aws" {
  region = "us-east-1"
}

# Create subnet in existing VPC
resource "aws_subnet" "jenkins_subnet" {
  vpc_id                  = "vpc-0c943292e0a2f93cf"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "jenkins-subnet"
  }
}

# Create security group in existing VPC
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH"
  vpc_id      = "vpc-0c943292e0a2f93cf"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

# Launch EC2 instance in custom VPC
resource "aws_instance" "name" {
  ami                         = "ami-08a6efd148b1f7504"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.jenkins_subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "jenkins-instance"
  }
}
