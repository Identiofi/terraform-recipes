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
  region = "eu-north-1"
}

# We'll need a secondary provider though, this one will be used for a couple of services
# only available in the US.
provider "aws" {
  region = "us-east-1"
  alias  = "aws-us"
}