# Configuring providers and backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }

  backend "s3" {
    bucket = "100daysofcloud-eduardoegito"
    key    = "terraform-COM04-AWS200.tfstate"
    region = "us-east-1"
  }
}

# Configuring the AWS Provider
provider "aws" {
  region = "us-east-1"
}

##### TASK 2 - Authenticate your Docker to Amazon ECR
provider "docker" {
  registry_auth {
    address = local.aws_ecr_url
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }  
}