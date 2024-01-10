terraform {
  backend "s3" {
    bucket = "terra-backend-s3"
    key    = "terra-backend-s3"
    region = "us-east-2"
  }
}
