resource "aws_security_group" "jenkins" {
  name        = jenkins"
  description = "this security group created for jenkins server"
  vpc_id      = "vpc-xxxxxxxx" # 🔹 replace with your VPC ID

  # Inbound - allow everything
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"            # all protocols
    cidr_blocks = ["0.0.0.0/0"]   # all IPv4
    ipv6_cidr_blocks = ["::/0"]   # all IPv6
  }

  # Outbound - allow everything
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
