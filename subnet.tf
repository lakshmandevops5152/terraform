resource "aws_subnet" "tpni-1" {
  vpc_id     = aws_vpc.tpni.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tpni-1"
  }
}
resource "aws_subnet" "tpni-2" {
  vpc_id     = aws_vpc.tpni.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tpni-2"
  }
}
resource "aws_subnet" "tpni-3" {
  vpc_id     = aws_vpc.tpni.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "tpni-3"
  }
}

