provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "instance_1" {
  ami           = "ami-05ffe3c48a9991133"  # update to correct region-specific AMI
  instance_type = var.instanceType

  tags = {
    Name = var.instanceName
  }
}