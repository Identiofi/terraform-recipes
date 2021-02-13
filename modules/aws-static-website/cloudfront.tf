locals {
  app_public_s3_origin = "${var.domain_name}_origin"
}
resource "aws_cloudfront_origin_access_identity" "app_access_id" {
  comment = "CloudFront access for ${var.domain_name}"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.app_access_id.cloudfront_access_identity_path
    }

    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = local.app_public_s3_origin
  }

  enabled             = true
  default_root_object = var.s3_index_file

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = var.cors_methods
    cached_methods         = var.cached_methods
    target_origin_id       = local.app_public_s3_origin
    min_ttl                = var.cloudfront_min_ttl
    default_ttl            = var.cloudfront_default_ttl
    max_ttl                = var.cloudfront_max_ttl

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  # You may wish to uncomment this block to fix redirections
  # in case you're working on a spa-application where
  # routing is handled by JavaScript
  # custom_error_response {
  #   error_caching_min_ttl = 60
  #   error_code            = 404
  #   response_code         = 200
  #   response_page_path    = "/index.html"
  # }

  aliases = concat([var.domain_name], var.alternative_domains)

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate_validation.viewer_certificate.certificate_arn
    ssl_support_method  = "sni-only"
  }
}
