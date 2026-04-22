
output "validation_records" {
  value = [
    for record in cloudflare_record.validation :
    record.hostname
  ]
}