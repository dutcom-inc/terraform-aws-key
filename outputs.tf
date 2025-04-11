output "aws_key_name" {
  value = aws_key_pair.default.key_name
}

output "aws_key_pem" {
  value = "${lower(local.name)}.pem"
}