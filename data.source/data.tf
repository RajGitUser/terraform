data "aws_ami" "joindevops" {
    owners           = ["137112412989"]
    most_recent      = true

    filter {
        name   = "name"
        values = ["al2023-ami-2023.8.20250818.0-kernel-6.1-x86_64"]
    }

    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

data "aws_instance" "dummy" {          #### we should give the instance name in the place of instance_name
    instance_id = "i-0211d142821bc3dd0"        #### this will usefull for to get the data of already created instance
}

output "instance_data" {
    value = data.aws_instance.dummy.private_ip    ### shange the instnace_name
}