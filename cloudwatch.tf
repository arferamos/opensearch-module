resource "aws_cloudwatch_log_group" "index_slow" {
  count = var.enable_index_slow_logs ? 1 : 0

  name              = local.log_group_names.index_slow
  retention_in_days = var.cloudwatch_log_retention_in_days

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "search_slow" {
  count = var.enable_search_slow_logs ? 1 : 0

  name              = local.log_group_names.search_slow
  retention_in_days = var.cloudwatch_log_retention_in_days

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "application" {
  count = var.enable_application_logs ? 1 : 0

  name              = local.log_group_names.application
  retention_in_days = var.cloudwatch_log_retention_in_days

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "audit" {
  count = var.enable_audit_logs ? 1 : 0

  name              = local.log_group_names.audit
  retention_in_days = var.cloudwatch_log_retention_in_days

  tags = var.tags
}