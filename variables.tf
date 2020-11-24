variable "aws_profile_name" {
  description = "AWS profile name used to identify used credentials"
  default     = "identio_development"
}

variable "aws_credentials_file" {
  description = "Location of your AWS credentials file."
  default     = "~/.aws/creds"
}