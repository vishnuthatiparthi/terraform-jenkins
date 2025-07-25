resource "aws_subnet" "jenkins_subnet" {
  vpc_id                  = "vpc-0c943292e0a2f93cf"
  cidr_block              = "10.0.101.0/24" # Changed from 10.0.1.0/24
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "jenkins-subnet"
  }
}
