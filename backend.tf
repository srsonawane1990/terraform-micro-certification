terraform {
  backend "s3" {
    bucket = "internal-globant"
    key    = "tf-states/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
