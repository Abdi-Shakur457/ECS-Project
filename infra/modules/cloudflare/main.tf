
terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}



resource "cloudflare_record" "ecs" {
  zone_id = var.zone_id
  name    = "ecs"
  type    = "CNAME"
  content = var.alb_dns_name
  proxied = false
}