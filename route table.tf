resource "aws_route_table" "demo_rt" {
  vpc_id = aws_vpc.Devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Devops-igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "demo_rt_association" {
  subnet_id      = aws_subnet.Devops-1.id
  route_table_id = aws_route_table.demo_rt.id
}

resource "aws_route_table" "Devops_rt" {
  vpc_id = aws_vpc.Devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Devops-igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "Devops-1subnet_rt_association" {
  subnet_id      = aws_subnet.Devops-1.id
  route_table_id = aws_route_table.Devops_rt.id
}
resource "aws_route_table_association" "Devops-2subnet_rt_association" {
  subnet_id      = aws_subnet.Devops-2.id
  route_table_id = aws_route_table.Devops_rt.id
}
resource "aws_route_table_association" "Devops-3subnet_rt_association" {
  subnet_id      = aws_subnet.Devops-2.id
  route_table_id = aws_route_table.Devops_rt.id
}

