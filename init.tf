terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key =""
  secret = ""
}

data "aws_ami" "ubuntu" {
 most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-xxxxxxxx"]
  }

  filter {
    name   = "tag:Name"
    values = ["instance-name-tag"]
  }

  resource "aws_instance" "web" {
      ami = data.aws.ami.ubuntu.id
      instance_type = "t1.micro"
  }

  tags={
      Name= "hello world"
  }

  ebs_block_device {
      device_name= "/dev/sda1"
      volume_size = 15
      volume_type = "gp3"
  }
}