# Create Subnets
resource "aws_subnet" "devops_subnet1" {
  vpc_id                  = aws_vpc.tpni.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-subnet-1"
  }
}

resource "aws_subnet" "devops_subnet2" {
  vpc_id                  = aws_vpc.tpni.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-subnet-2"
  }
}

resource "aws_subnet" "devops_subnet3" {
  vpc_id                  = aws_vpc.tpni.id
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-subnet-3"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.tpni.id

  tags = {
    Name = "devops-igw"
  }
}

# Create Route Table
resource "aws_route_table" "devops_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }

  tags = {
    Name = "devops-rt"
  }
}

# Associate Subnets with Route Table
resource "aws_route_table_association" "devops_subnet1_assoc" {
  subnet_id      = aws_subnet.devops_subnet1.id
  route_table_id = aws_route_table.devops_rt.id
}

resource "aws_route_table_association" "devops_subnet2_assoc" {
  subnet_id      = aws_subnet.devops_subnet2.id
  route_table_id = aws_route_table.devops_rt.id
}

resource "aws_route_table_association" "devops_subnet3_assoc" {
  subnet_id      = aws_subnet.devops_subnet3.id
  route_table_id = aws_route_table.devops_rt.id
}
