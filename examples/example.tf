module "example" {
  source          = "../."
  gh_username     = "robbyoconnor"                  # optional, if you enable cnames, it will use this to generate username.github.io
  gh_pages_cnames = ["www", "anotherone", "thrice"] # optional
  cf_zone_id      = var.cf_zone_id
  cf_api_token    = var.cf_api_token
}
