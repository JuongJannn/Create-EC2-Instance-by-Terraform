provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "lab2-keypair" {
  key_name = "testlab2-keypair"
  public_key = file("my-key.pub")#Import đúng cleapublic key
}

resource "aws_instance" "lab2-instance" {
  ami                     = "ami-0b03299ddb99998e9"
  instance_type           = "t2.micro"
  key_name = aws_key_pair.lab2-keypair.key_name 
  tags = {
    Name= "testlab2"
  }
  vpc_security_group_ids = [aws_security_group.test-security-group.id] #Đã khai báo
}

resource "aws_security_group" "test-security-group" {
  name        = "test-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép SSH từ mọi nơi (Cần chỉnh nếu cần bảo mật)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép HTTP từ mọi nơi
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép tất cả outbound traffic
  }
}
