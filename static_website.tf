data "aws_route53_zone" "pulma_dev" {
  name = "pulma.dev"
}

module "example-website" {
  source                  = "./modules/aws-static-website"
  domain_name          = "terraform-recipes.pulma.dev"
  zone_id                 = data.aws_route53_zone.pulma_dev.zone_id
  tags = {
    project = "terraform-recipes"
  }

  credentials_file = var.aws_credentials_file
  credentials_profile = var.aws_profile_name
}
