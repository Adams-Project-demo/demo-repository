provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id  # update to correct region-specific AMI
  instance_type = var.instanceType
  # vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = var.assign_public_ip
  tags = {
    Name = var.instanceName
    PublicIP = var.assign_public_ip ? "Enabled" : "Disabled"
    # VPC = var.vpc_arn != "" ? "Custom VPC" : "Default VPC"
  }
  lifecycle {
    create_before_destroy = true
  }
}

