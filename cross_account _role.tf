data "databricks_aws_assume_role_policy" "dbr_assume_role_policy" {
  external_id = local.databricks_account_id
}

resource "aws_iam_role" "cross_account_role" {
  name               = "${local.prefix}-crossaccount"
  assume_role_policy = data.databricks_aws_assume_role_policy.dbr_assume_role_policy.json
  tags               = var.tags
}

data "databricks_aws_crossaccount_policy" "dbr_aws_crossaccount_policy" {
}

resource "aws_iam_role_policy" "dbr_iam_role_policy" {
  name   = "${local.prefix}-policy"
  role   = aws_iam_role.cross_account_role.id
  policy = data.databricks_aws_crossaccount_policy.dbr_aws_crossaccount_policy.json
}

resource "databricks_mws_credentials" "dbr_mws_credentials" {
  provider         = databricks.mws
  account_id       = local.databricks_account_id
  role_arn         = aws_iam_role.cross_account_role.arn
  credentials_name = "${local.prefix}-creds"
  depends_on = [
    time_sleep.wait_time
  ]
}

resource "time_sleep" "wait_time" {
  depends_on = [
    aws_iam_role.cross_account_role
  ]
  create_duration = "10s"
}

