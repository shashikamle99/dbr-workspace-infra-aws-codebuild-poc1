terraform {
  backend "s3" {
    bucket = "terra-backend-s3"
    key    = "db-workspace"
    region = "us-east-2"
  }
}
