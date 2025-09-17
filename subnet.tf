

# Create Subnets
resource "aws_subnet" "devops-suvnet-1"
subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-suvnet-1"
  }
}

resource "aws_subnet" "devops-subnet2" {
  vpc_id                  = aws_vpc.devops_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "evops-subnet2
  }
}

resource "aws_subnet" "devops-subnet3" {
  vpc_id                  = aws_vpc.devops_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "evops-subnet3"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "devops-igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops-igw"
  }
}

# Create Route Table
resource "aws_route_table" "devops-rt" {
  vpc_id = aws_vpc.devops_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.evops-igw".id
  }

  tags = {
    Name = "devops-rt"
  }
}
# Associate Subnets with Route Table
resource "aws_route_table_association" "adevops-subnet-1" {
  subnet_id      = aws_subnet.devops-suvnet-1.id
  route_table_id = aws_route_table.evops-rt.id
}

resource "aws_route_table_association" "devops-subnet-2" {
  subnet_id      = aws_subnet.devops-suvnet-2.id
  route_table_id = aws_route_table.evops-rt.id
}

resource "aws_route_table_association" "a3" {
  subnet_id      = aws_subnet.devops-suvnet-3.id
  route_table_id = aws_route_table.evops-rt.id
}

