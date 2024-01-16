terraform {
  backend "s3" {
    bucket = "dbr-s3-bucket"
    key    = "terra-backend-poc-1"
    region = "us-east-1"
  }
}
