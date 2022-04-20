#### Basic Information ####
  
# Provider Information
provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  # Library ����
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.20"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }

  # Terraform ����
  required_version = ">= 0.13"

  # State ����� S3 Backend ����
  backend "s3" {
    bucket = "s3-jsh-terraform-state"
    key    = "aws-an2/test/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "table-jsh-terraform-lock"
    encrypt = true
  }
}

#### Remote State Data Source ####
data "aws_availability_zones" "all" {}