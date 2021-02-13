variable "domain_name" {
  description = "Domain name is also used to specify the names of relevant module-resources."
}

variable "zone_id" {
  description = "Id for the hosted zone to build resources under."
}

variable "alternative_domains" {
  description = "Alternative domain names for certificate etc."
  default     = []
}

variable "tags" {
  description = "Tags to associate with resources."
}

# S3 variables
variable "s3_index_file" {
  default = "index.html"
}

variable "s3_acl" {
  default = "public-read"
}

# S3 variables used in the cors_rule block
variable "cors_headers" {
  default = ["*"]
}

variable "cors_methods" {
  default = ["GET", "HEAD"]
}

variable "cors_origins" {
  default = ["*"]
}

variable "cors_max_age" {
  default = 1200
}

# Cloudfront

variable "cloudfront_default_ttl" {
  description = "Cloudfront's default time to live in seconds"
  default     = 60
}

variable "cloudfront_min_ttl" {
  description = "Cloudfront's min time to live in seconds"
  default     = 0
}

variable "cloudfront_max_ttl" {
  description = "Cloudfront's max time to live in seconds"
  default     = 180
}

variable "credentials_file" {
  description = "AWS shared credentials path"
}

variable "credentials_profile" {
  description = "AWS credentials profile, if multiple"
}

variable "cached_methods" {
  description = "Methods cached by cloudfront"
  default = ["GET", "HEAD"]
}