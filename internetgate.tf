resource "aws_internet_gateway" "Devops-igw" {
  vpc_id = aws_vpc.Devops.id

  tags = {
    Name = "Devops-igw"
  }
}