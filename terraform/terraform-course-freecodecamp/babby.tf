terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # go log into AWS and put the access key ID and the secret access key into these 2 files
  access_key = file("~/.terraform/aws_access_key")  
  secret_key = file("~/.terraform/aws_secret_key")
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
