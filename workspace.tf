resource "databricks_mws_workspaces" "dbr_mws_workspaces" {
  provider       = databricks.mws
  account_id     = local.databricks_account_id
  aws_region     = var.region
  workspace_name = local.prefix

  credentials_id           = databricks_mws_credentials.dbr_mws_credentials.credentials_id
  storage_configuration_id = databricks_mws_storage_configurations.dbr_mws_storage.storage_configuration_id
  network_id               = databricks_mws_networks.dbr_mws_networks.network_id

  token {
    comment = "Terraform"
  }
}

output "databricks_host" {
  value = databricks_mws_workspaces.dbr_mws_workspaces.workspace_url
}

output "databricks_token" {
  value     = databricks_mws_workspaces.dbr_mws_workspaces.token[0].token_value
  sensitive = true
}