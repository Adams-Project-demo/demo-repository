variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "aws_region" {
  description = "The AWS region where the Lambda function will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "memory_size" {
  description = "The amount of memory available to the Lambda function (in MB)"
  type        = number
  default     = 512  
}

variable "timeout" {
  description = "The amount of time (in seconds) that Lambda function will run before it times out"
  type        = number
  default     = 30 
}

variable "image_uri" {
  description = "The URI of the Docker image in ECR"
  type        = string
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository where the Docker image will be stored"
  type        = string
  default     = "backstage/python-lambda"
}