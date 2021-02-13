# Provides the required provider configurations for this module

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = var.credentials_file
  profile                 = var.credentials_profile
  alias                   = "us"
}
