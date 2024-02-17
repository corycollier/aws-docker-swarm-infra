# environments/production/servers/acm.tf

resource "aws_acm_certificate" "main" {
  domain_name               = "*.${var.domain_name}"
  key_algorithm             = "RSA_2048"
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.domain_name}"]

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}
