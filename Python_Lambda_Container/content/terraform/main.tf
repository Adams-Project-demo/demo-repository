terraform {
  required_version = ">=1.0"
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "lambda_role" {
    name = "${var.function_name}-lambda-role"
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
        }
      ]
    })

    tags = {
      Name = "${var.function_name}-lambda-role"
      Environment = "dev"
      CreeatedBy = "Backstage"
    }
}

resource "aws_lambda_function" "hello_world" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  package_type  = "Image"
  image_uri     = var.image_uri
  memory_size   = var.memory_size
  timeout       = var.timeout

  environment {
    variables = {
        ENVIRONMENT = "production"
        FUNCTION_NAME = var.function_name
    }
  }

  tags = {
    Name        = var.function_name
    Environment = "dev"
    CreatedBy   = "Backstage"
  }
}

resource "aws_lambda_function_url" "hello_world_url" {
  function_name = aws_lambda_function.hello_world.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = false
    allow_origins = ["*"]
    allow_methods = ["GET", "POST"]
    allow_headers = ["date", "keep-alive"]
    expose_headers = ["date", "keep-alive"]
    max_age = 86400
  }
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
    name = "aws/lambda/${var.function_name}"
    retention_in_days = 14
    tags = {
        Name = "${var.function_name}-logs"
        Environment = "dev"
        CreatedBy = "Backstage"
    }
}