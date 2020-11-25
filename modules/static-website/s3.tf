# The s3-bucket will be the home to your static resources
resource aws_s3_bucket "bucket" {
  bucket = var.domain_name
  acl    = var.s3_acl

  website {
    index_document = var.s3_index_file
  }

  # Cors rules provide you with an easy access-control
  # when you need to limit access or delivery
  cors_rule {
    allowed_headers = var.cors_headers
    allowed_methods = var.cors_methods
    allowed_origins = var.cors_origins
    max_age_seconds = var.cors_max_age
  }
}