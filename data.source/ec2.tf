resource "aws_instance" "terraform" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "terraform"
  }
}

resource "aws_security_group" "allow_all" {
  name = "allow_all"


  egress {
    from_port        = 0             ## allowing all posrts from starting
    to_port          = 0             ## allowing all ports to the ending
    protocol         = "-1"          ## means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet notation
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0             ## allowing all posrts from starting
    to_port          = 0             ## allowing all ports to the ending
    protocol         = "-1"          ## means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet notation
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
