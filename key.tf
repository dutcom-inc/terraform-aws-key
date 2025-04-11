resource "tls_private_key" "default" {
  algorithm = "RSA"
  rsa_bits  = 4096

  provisioner "local-exec" {
    command = <<EOT
    file="${path.module}/tmp/${lower(local.name)}.pem"

    if [ -f "$file" ] ; then
        rm "$file"
    fi
    EOT
  }
}

resource "local_sensitive_file" "default" {
  filename = "${path.module}/tmp/${lower(local.name)}.pem"
  content = tls_private_key.default.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "default" {
  key_name   = local.name
  public_key = tls_private_key.default.public_key_openssh

  tags = merge(
    local.common_tags
  ) 
}