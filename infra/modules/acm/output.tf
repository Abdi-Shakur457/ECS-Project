output "certificate_arn" {
    description = "The ARN of the ACM certificate"
    value       = aws_acm_certificate.cert.arn
  
}

output "domain_validation_options" {
  value = aws_acm_certificate.cert.domain_validation_options
}