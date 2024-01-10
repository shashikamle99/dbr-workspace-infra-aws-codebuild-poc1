data "aws_ssm_parameter" "client_id" {
  name = "dbr_client_id"
}

data "aws_ssm_parameter" "client_secret" {
  name = "dbr_client_secret"
}

data "aws_ssm_parameter" "dbr_account_id" {
  name = "databricks_account_id"
}