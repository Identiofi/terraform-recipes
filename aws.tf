terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Our default AWS provider is set up just next door of Finland in Stockholm
provider "aws" {
  region                  = "eu-north-1"
  shared_credentials_file = var.aws_credentials_file
  profile                 = var.aws_profile_name
}

# We'll need a secondary provider though, this one will be used for a couple of services
# only available in the US.
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = var.aws_credentials_file
  profile                 = var.aws_profile
  alias                   = "us"
}