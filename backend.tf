terraform {
  backend "s3" {
    bucket = "mahaterraform-ec2"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
