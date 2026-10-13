terraform {
  backend "s3" {
    bucket         = "multi-stack-devops-state-686699774218"
    key            = "voting-app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "multi-stack-devops-terraform-lock"
  }
}