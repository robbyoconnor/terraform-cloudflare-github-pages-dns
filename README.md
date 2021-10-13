# Terraform Module to create the DNS entries for [GitHub Pages](https://pages.github.com).



This was developed primarily for myself, but I am releasing it in the hopes it helps someone else. This works only with Cloudflare DNS.


This will create A and AAAA records for the apex of your domain name. If you do not want this, you can set `use_apex` to `false` in the module block. You should use CNAMEs in that case by specifying them in the `gh_pages_cnames` set.

**Note**: This does not create the repository.

This can be found on the [Terraform Registry](https://registry.terraform.io/modules/robbyoconnor/github-pages-dns/cloudflare/latest).

## Example usage

```terraform
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

module "example" {
  source          = "robbyoconnor/github-pages-dns/cloudflare"
  version         = "1.0.0"
  gh_username     = "robbyoconnor"                  # optional, if you enable cnames, it will use this to generate username.github.io
  gh_pages_cnames = ["www", "anotherone", "thrice"] # optional
  cf_zone_id      = var.cf_zone_id
  cf_api_token    = var.cf_api_token
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.apex_a_records](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.apex_aaaa](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.cnames](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | This is the API token. You can obtain it at https://dash.cloudflare.com/profile/api-tokens | `string` | n/a | yes |
| <a name="input_cf_zone_id"></a> [cf\_zone\_id](#input\_cf\_zone\_id) | The ID of the cloudflare zone | `string` | n/a | yes |
| <a name="input_gh_pages_cnames"></a> [gh\_pages\_cnames](#input\_gh\_pages\_cnames) | CNAMEs for your github pages. This can span multiple repositories. | `set(string)` | `[]` | no |
| <a name="input_gh_pages_ipv4"></a> [gh\_pages\_ipv4](#input\_gh\_pages\_ipv4) | IPv4 records for GitHub pages | `list(string)` | <pre>[<br>  "185.199.108.153",<br>  "185.199.109.153",<br>  "185.199.110.153",<br>  "185.199.111.153"<br>]</pre> | no |
| <a name="input_gh_pages_ipv6"></a> [gh\_pages\_ipv6](#input\_gh\_pages\_ipv6) | IPv6 records for GitHub pages | `list(string)` | <pre>[<br>  "2606:50c0:8000::153",<br>  "2606:50c0:8001::153",<br>  "2606:50c0:8002::153",<br>  "2606:50c0:8003::153"<br>]</pre> | no |
| <a name="input_gh_username"></a> [gh\_username](#input\_gh\_username) | Your github username (or org name). Required if CNAMEs are specified. | `string` | `""` | no |
| <a name="input_use_apex"></a> [use\_apex](#input\_use\_apex) | Sometimes people don't use the apex and rather use a subdomain, in that case, a CNAME is fine. | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
