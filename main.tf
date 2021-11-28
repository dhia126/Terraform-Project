provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

locals {
  my-name = "dhia"
}


data "aws_ami" "main_ami"{
  owners = ["self"]  #required just for this one
  most_recent = true #we use the last ami we used before
}



resource "aws_vpc" "main" {
  cidr_block  = "10.5.0.0/16"
  tags        = {
      Name = "${local.my-name}-vpc"
  }
}

resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.main.id #id here refers to the cidr_block of the vpc 
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "dhia-subnet"
  }
}

resource "aws_instance" "ec2-example" {
  count = 3
  ami           = "${lookup(var.AMIS,var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.web.id #id here refers to the cidr_block of the subnet
  tags = {
      Name = "Terraform_${count.index+1}"
  }
}

output "my-vpc" {
  value       = aws_vpc.main
  description = "This a hole description of my aws vpc"
}
output "my-subnet" {
  value       = aws_subnet.web
  description = "This a hole description of my aws subnet"
}
output "my-instance_ip_dress" {
  value       = aws_instance.ec2-example[*].public_ip #similar to: [for instance in aws_instance.ec2-example : instance.public_ip]
  description = "This a hole description of my aws aws ec2 instance"
}





