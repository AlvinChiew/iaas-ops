# resource "cloudflare_page_rule" "foobar" {
#   zone_id = var.cloudflare_zone_id
#   target = "sub.${var.cloudflare_zone}/page"
#   priority = 1

#   actions {
#     ssl = "flexible"
#     email_obfuscation = "on"
#     minify {
#       html = "off"
#       css  = "on"
#       js   = "on"
#     }
#   }
# }
