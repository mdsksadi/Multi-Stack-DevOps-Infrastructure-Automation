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
