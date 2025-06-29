output "instance_id" {
    description = "The ID of the EC2 instance"
    value = aws_instance.instance_1.id
}