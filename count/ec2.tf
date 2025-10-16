resource "aws_instance" "terraform" {
  count = 3                   ###### this is the count we aaded here
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = var.instances[count.index]   ### here also we added count.index this will loop the num of counts
    terraform = "true"
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
