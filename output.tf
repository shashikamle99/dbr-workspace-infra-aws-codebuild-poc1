output "dbr_client_secret" {
  value = data.aws_ssm_parameter.client_id.value
  sensitive = true
}

output "dbr_client_id" {
  value = data.aws_ssm_parameter.client_secret.value
  sensitive = true
}

output "databricks_account_id" {
  value = data.aws_ssm_parameter.dbr_account_id.value
  sensitive = true
}

locals {
    client_id = data.aws_ssm_parameter.client_id.value
    client_secret = data.aws_ssm_parameter.client_secret.value
    databricks_account_id = data.aws_ssm_parameter.dbr_account_id.value
}