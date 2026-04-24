terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "aws" {
  region = var.region
  #Configuration options
}

terraform {
  backend "s3" {
    bucket         = "ecs-s3-v1"
    key            = "ecs-project/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "ecs-terraform-locks"
    encrypt        = true
  }
}

