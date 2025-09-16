terraform {
  backend "s3" {
    bucket         = "lakshman-trraform"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
