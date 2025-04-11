output "aws_key_name" {
  value = aws_key_pair.kaptngo.key_name
}

output "aws_key_pem" {
  value = "${lower(local.name)}.pem"
}