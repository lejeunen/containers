terraform {
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "ema-terraform-dev"
    key            = "terraform.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-state-lock-dev"
  }
}