variable "instanceName" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "instanceType" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}