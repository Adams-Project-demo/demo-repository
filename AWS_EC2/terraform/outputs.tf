output "instance_id" {
    description = "The ID of the EC2 instance"
    value = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = var.assign_public_ip ? aws_instance.ec2_instance.public_ip : null
}

# output "instance_private_ip" {
#     description = "The private IP address of the EC2 instance"
#     value = aws_instance.ec2_instance.private_ip
# }