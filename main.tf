terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cf_api_token
}

resource "cloudflare_record" "apex_a_records" {
  count   = var.use_apex ? length(var.gh_pages_ipv6) : 0
  zone_id = var.cf_zone_id
  name    = "@"
  type    = "A"
  value   = var.gh_pages_ipv4[count.index]
  ttl     = 300
  proxied = false

}

resource "cloudflare_record" "apex_aaaa" {
  count   = var.use_apex ? length(var.gh_pages_ipv6) : 0
  zone_id = var.cf_zone_id
  name    = "@"
  type    = "AAAA"
  value   = var.gh_pages_ipv6[count.index]
  ttl     = 300
  proxied = false

}

resource "cloudflare_record" "cnames" {
  zone_id  = var.cf_zone_id
  for_each = var.gh_pages_cnames
  name     = each.value
  type     = "CNAME"
  value    = "${var.gh_username}.github.io"
  ttl      = 300
  proxied  = false
}
