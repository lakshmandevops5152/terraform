# EC2 Instance
resource "aws_instance" "jenkins" {
  ami                    = "mi-01b6d88af12965bb6" # Amazon Linux 2 AMI in ap-south-1
  ami                    = "" # Amazon Linux 2 AMI in ap-south-1
  instance_type          = "t2.micro"
  subnet_id              = "subnet-xxxxxxxx" # replace with your Subnet ID
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "Jenjins"
  root_block_device {
    volume_size = 20      # set root volume to 20 GB
    volume_type = "gp3"   # general purpose SSD
  }

  tags = {
    Name = "jenkins"
  }
}

  tags = {
    Name = "jenkins"
  }
}
