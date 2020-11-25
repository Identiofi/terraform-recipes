variable "domain_name" {
  description = "Domain name is also used to specify the names of relevant module-resources."
}

variable "zone_id" {
  description = "Zone"
}

variable "alternative_domains" {
  description = "Alternative domain names for certificate etc."
  default     = []
}

variable "tags" {
  description = "Tags to associate with resources"
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