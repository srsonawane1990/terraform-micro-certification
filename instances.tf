resource "aws_instance" "jump_host" {
  ami                         = "ami-0a1179631ec8933d7" 
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id 
  associate_public_ip_address = true
  tags = {
    Name = "jump-host"
  }
}

resource "aws_instance" "backend_instance_1" {
  ami           = "ami-0a1179631ec8933d7" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private[0].id
  tags = {
    Name = "backend-instance-1"
  }
}

resource "aws_instance" "backend_instance_2" {
  ami           = "ami-0a1179631ec8933d7" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private[1].id
  tags = {
    Name = "backend-instance-2"
  }
}
