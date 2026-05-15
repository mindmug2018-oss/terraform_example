# terraform_example/test10_route53/route53.tf

data "aws_route53_zone" "selected" {
    name = "${var.domain_name}."
    private_zone = false
}

#2
resource "aws_acm_certificate" "cert" {
  domain_name       = "*.${var.domain_name}" # 서브도메인용 (*.cloud-study.in)
  validation_method = "DNS"
  
  # 루트 도메인(cloud-study.in)도 함께 보호
  subject_alternative_names = [var.domain_name]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "lecture-certificate"
  }
}

#3
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.selected.zone_id
}

#4
# 이 리소스가 성공적으로 완료되면 콘솔에서 '발급됨(Issued)' 상태를 볼 수 있습니다.
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

#5
output "certificate_arn" {
    value = aws_acm_certificate_validation.cert.certificate_arn
}