terraform {
  backend "s3" {
    bucket = "terraform.bostondsa.org"
    key    = "sns-discord-webhook.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
