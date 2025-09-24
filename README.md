# Learn_Terraform

A sample of learning Terraform projects

# Get_Started_AWS

Creating terraform.tf and main.tf

terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 5.92"
}
}

required_version = ">= 1.2"
}

main.tf

provider "aws" {
region = "us-west-2"
}

data "aws_ami" "ubuntu" {
most_recent = true

filter {
name = "name"
values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
}

owners = ["099720109477"] # Caconical
}

resource "aws_instance" "app_server" {
ami = data.aws_ami.ubuntu.id

# instance_type = "t2.mirco"

instance_type = var.instance_type

vpc_security_group_ids = [module.vpc.default_security_group_id]
subnet_id = module.vpc.private_subnets[0]

tags = { # Name = "learn-terraform"
Name = var.instance_name
}
}

# Create outputs.tf and variables.tf

    output "instance_hostname" {
    description = "Private DNS name of the EC2 instance"
    value       = aws_instance.app_server.private_dns

    }

    variable "instance_name" {
    description = "Value of the EC2 instance's Name tag."
    type        = string
    default     = "learn-terraform"
    }

# Create HCP terraform using remote.

terraform login
