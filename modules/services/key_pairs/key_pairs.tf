# Create key-pair
resource "tls_private_key" "my-p-key" {
  algorithm   = "RSA"
  rsa_bits  = 4096
}

# locally store
resource "local_file" "pri_key" {
    content     = tls_private_key.my-p-key.public_key_openssh
    filename = "mykey.pem"
    //file_permission = 0400
}
 
# Create new aws key_pair
resource "aws_key_pair" "my-key" {
  key_name   = "mykey"
  public_key = tls_private_key.my-p-key.public_key_openssh
}
