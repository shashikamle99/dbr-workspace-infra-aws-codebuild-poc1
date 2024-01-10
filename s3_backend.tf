terraform {
  backend "s3" {
    bucket = "terra-backend-s3"
    key    = "terra-backend-poc-1"
    region = "us-east-2"
  }
}
