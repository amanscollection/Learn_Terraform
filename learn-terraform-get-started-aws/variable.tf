variable "instance_name" {
  description = "Value of the EC2 instance's Name tag."
  type        = string
  default     = "learn-terraform"
}

variable "instance_type" {
  description = "the EC2 instance's type"
  type        = string
  default     = "t2.mirco"
}
