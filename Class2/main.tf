resource "aws_key_pair" "deployer" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-yanar"
}

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-yanar"
  key    = "provider.tf"
  source = "provider.tf"
}