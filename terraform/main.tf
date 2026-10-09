terraform {
  required_version = ">= 1.5.0"

  required_providers {
    # we need to use aws provider for this project
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ----------------------------------
# Region
# ----------------------------------

provider "aws" {
  region = var.aws_region
}

# ----------------------------------
# VPC
# ----------------------------------

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}