# Create Private Key
resource "tls_private_key" "private_key" {
  algorithm   = "RSA"
  rsa_bits  = 4096
}

# Store private Key Locally
resource "local_file" "local_private_key" {
    content     = tls_private_key.private_key.private_key_openssh
    filename = var.pem_file_name
    file_permission = 400
}
 
# Create new aws key_pair
resource "aws_key_pair" "key_pair" {
  key_name   = var.name
  public_key = tls_private_key.private_key.public_key_openssh
}
