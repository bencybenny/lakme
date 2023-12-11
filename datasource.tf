data "aws_route53_zone" "hostedzone" {
  name         = var.hosted_zone_name
  private_zone = false
}
