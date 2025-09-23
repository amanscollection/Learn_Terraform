# Learn_Terraform

A sample of learning Terraform projects

# Get_Stated_AWS

Creating terraform.tf and main.tf

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
