variable "instanceName" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "instanceType" {
  description = "Instance Type"
  type        = string
}

# variable "assign_public_ip" {
#   description = "Whether to assign a public IP address to the instance"
#   type        = bool
#   default     = true
# }