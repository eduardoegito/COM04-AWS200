# Configuring providers and backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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

resource "aws_ecr_repository" "ecr_repo" {
  name                 = "caduegito"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}