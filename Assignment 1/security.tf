resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allow inbound traffic on port 80"


  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
}

  
  tags = {
    Name = "my_security_group"
  }
}