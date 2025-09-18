resource "aws_security_group" "Devops-sg-1" {
  name        = "demo_1"
  description = "This sg for demo instance"
  vpc_id      = aws_vpc.Devops.id

  tags = {
    Name = "Devops"
  }
}


resource "aws_security_group_rule" "inboud_allo_all_port" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_1.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Devops-sg-1.id
}

