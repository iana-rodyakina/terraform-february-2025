resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Name = "Hello"
    Teams = "DevOps"
  }
}

terraform {
  backend "s3" {
    bucket = "kaizen-yanar"
    key    = "terraform.tfstate"
    region = "us-east-1"
   use_lockfile = true
  }
}


