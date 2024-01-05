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
  name = "my-access-key"
  
}

data "aws_ssm_parameter" "foo1" {
  name = "my-secret-key"
  
}

provider "aws" {
  region = var.region
  access_key = data.aws_ssm_parameter.foo.value
  secret_key = data.aws_ssm_parameter.foo1.value
}

// initialize provider in "MWS" mode to provision new workspace
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}