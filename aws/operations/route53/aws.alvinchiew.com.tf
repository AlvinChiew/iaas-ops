resource "aws_route53_zone" "aws_alvinchiew" {
  name = "aws.alvinchiew.com"
}

# warning: Only http without SSL
# resource "aws_route53_record" "aws_alvinchiew" {
#   zone_id = aws_route53_zone.aws_alvinchiew.zone_id
#   name    = "unika"
#   type    = "CNAME"
#   ttl     = "300"
#   records = [var.unika_bucket_url]
# }

resource "aws_route53_record" "aws_alvinchiew" {
  zone_id = aws_route53_zone.aws_alvinchiew.zone_id
  name    = "unika"
  type    = "A"
  alias {
    name                   = var.unika_domain_name
    zone_id                = var.unika_zone_id
    evaluate_target_health = true
  }
}
