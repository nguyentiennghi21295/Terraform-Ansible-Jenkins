provider "aws" {
  region     = "eu-west-1"
  shared_credentials_file="/home/ubuntu/.aws/credentials"
}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}