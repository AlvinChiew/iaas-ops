# for import:
# guide: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record#import
# requirements: get zone id via cloudflare domain overview page; dns record id via https://api.cloudflare.com/#dns-records-for-a-zone-properties with api key via https://dash.cloudflare.com/profile/api-tokens (use Global API Key)
data "cloudflare_zones" "domain" {
  filter {
    name = "alvinchiew.com"
  }
}

resource "cloudflare_record" "root" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  type    = "A"
  name    = "alvinchiew.com"
  value   = "192.0.0.0" # random ipv4 addr for Forwarding/Redirect URL to work
  ttl     = 1           # 1 is automatic
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  type    = "CNAME"
  name    = "WWW"
  value   = "alvinchiew.com"
  ttl     = 1 # 1 is automatic
  proxied = true
}

# four name servers createed in AWS Route53
resource "cloudflare_record" "aws_ns" {
  for_each = toset(split("|", chomp(file("${path.root}/${var.aws_alvinchiew_ns}")))) # tflint-ignore: all

  zone_id = data.cloudflare_zones.domain.zones[0].id
  type    = "NS"
  name    = "aws"
  value   = each.value
  ttl     = 1 # 1 is automatic
}
