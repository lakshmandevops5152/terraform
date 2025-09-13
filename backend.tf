terraform {
  backend "s3" {
    bucket         = "telstra-terraform" 
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
