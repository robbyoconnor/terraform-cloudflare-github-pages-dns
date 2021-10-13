variable "cf_api_token" {
  description = "This is the API token. You can obtain it at https://dash.cloudflare.com/profile/api-tokens"
  type        = string
}
variable "cf_zone_id" {
  description = "The ID of the cloudflare zone"
  type        = string
}

variable "use_apex" {
  description = "Sometimes people don't use the apex and rather use a subdomain, in that case, a CNAME is fine."
  type        = bool
  default     = true
}

variable "gh_pages_ipv4" {
  description = "IPv4 records for GitHub pages"
  default     = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]
  type        = list(string)
}

variable "gh_pages_ipv6" {
  description = "IPv6 records for GitHub pages"
  default     = ["2606:50c0:8000::153", "2606:50c0:8001::153", "2606:50c0:8002::153", "2606:50c0:8003::153"]
  type        = list(string)
}

variable "gh_username" {
  description = "Your github username (or org name). Required if CNAMEs are specified."
  type        = string
  default     = ""
}

variable "gh_pages_cnames" {
  description = "CNAMEs for your github pages. This can span multiple repositories."
  type        = set(string)
  default     = []
}
