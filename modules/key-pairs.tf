# This resource creates an AWS key pair using the specified key name and public key.

resource "aws_key_pair" "my-key-pair" {
  key_name   = var.key_name
  public_key = file("${var.file_path}/${var.key_name}.pub")
}
