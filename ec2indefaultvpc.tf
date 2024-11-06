resource "aws_security_group" "demo" {
  name        = "demo"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # ... other configuration ...

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   ingress{
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "demo"
  }
  }


  resource "aws_instance" "Terraform" {
  ami = "ami-06b21ccaeff8cd686"
  vpc_security_group_ids = [aws_security_group.demo.id]
  instance_type = "t2.micro"
  tags = {
    Name = "test-spot"
  }
}