resource "cloudflare_page_rule" "redirect_www_alvinchiew" {
  zone_id  = data.cloudflare_zones.domain.zones[0].id
  target   = "https://www.alvinchiew.com/*"
  priority = 2

  actions {
    forwarding_url {
      url         = "https://linktr.ee/alvinchiew"
      status_code = 301
    }
  }
}
resource "cloudflare_page_rule" "redirect_alvinchiew" {
  zone_id  = data.cloudflare_zones.domain.zones[0].id
  target   = "https://alvinchiew.com/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://linktr.ee/alvinchiew"
      status_code = 301
    }
  }
}
