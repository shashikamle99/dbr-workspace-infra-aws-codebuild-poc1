terraform {
  backend "s3" {
    bucket = "dbr-artifact-1"
    key    = "terra-backend-s3"
    region = "us-east-2"
  }
}
