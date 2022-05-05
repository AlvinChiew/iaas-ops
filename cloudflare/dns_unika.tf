data "cloudflare_zones" "domain" {
  filter {
    name = var.site_domain
  }
}

resource "cloudflare_record" "unika" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "unika"
  value   = "unika.alvinchiew.com.s3-website-ap-southeast-1.amazonaws.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
