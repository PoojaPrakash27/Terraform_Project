# This resource creates an AWS key pair using the specified key name and public key.

resource "aws_key_pair" "my-key-pair" {
  public_key = file("${var.key_path}.pub")
}
