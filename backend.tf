terraform {
  backend "s3" {
    bucket = "demo-terraform-statefile"
    key    = "tpni_dev"
    region = "us-east-1"
    profile = "terraform"
  }
}
