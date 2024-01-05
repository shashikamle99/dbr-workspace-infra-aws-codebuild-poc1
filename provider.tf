terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
  }
}

data "aws_ssm_parameter" "foo" {
  access_key = "my_access_key"
  secret_key = "my_secret_key"
}

provider "aws" {
  region = var.region
  #access_key = "access_key"
  #secret_key = "secret_key"
}

// initialize provider in "MWS" mode to provision new workspace
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}