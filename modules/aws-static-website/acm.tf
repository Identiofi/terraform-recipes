# SSL certificate
resource "aws_acm_certificate" "viewer_certificate" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = var.alternative_domains
  tags                      = var.tags
  # Certificates need to be created in the same zone as using resources.
  # In this case, cloudfront, which can only exist on us-east.
  provider = aws.us
}

resource "aws_route53_record" "viewer_certificate_validation" {
  count = length(var.alternative_domains) + 1

  name            = element(aws_acm_certificate.viewer_certificate.domain_validation_options.*.resource_record_name, count.index)
  type            = element(aws_acm_certificate.viewer_certificate.domain_validation_options.*.resource_record_type, count.index)
  zone_id         = var.zone_id
  records         = [element(aws_acm_certificate.viewer_certificate.domain_validation_options.*.resource_record_value, count.index)]
  ttl             = 300
  allow_overwrite = true
}

# ACM certificates need to be explicitly validated with a validation resource
resource "aws_acm_certificate_validation" "viewer_certificate" {
  provider                = aws.us
  certificate_arn         = aws_acm_certificate.viewer_certificate.arn
  validation_record_fqdns = aws_route53_record.viewer_certificate_validation.*.fqdn
}
