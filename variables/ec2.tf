resource "aws_instance" "terraform" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_all" {
  name = var.sg_name


  egress {
    from_port        = var.engress_from_port            ## allowing all posrts from starting
    to_port          = var.engress_to_port            ## allowing all ports to the ending
    protocol         = var.protocol                            ## means all protocols
    cidr_blocks      = var.cidr                         # internet notation
  }

  ingress {
    from_port        = var.ingress_from_port             ## allowing all posrts from starting
    to_port          = var.ingress_to_port              ## allowing all ports to the ending
    protocol         = var.protocol                             ## means all protocols
    cidr_blocks      = var.cidr                           # internet notation
  }

  tags = {
    Name = "allow_all"
    description = "security group Name to attach to the EC2 instance"
  }
}
