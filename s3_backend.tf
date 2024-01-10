terraform {
  backend "s3" {
    bucket = "dbr-artifact-1"
    key    = "db-workspace"
    region = "us-east-2"
  }
}
