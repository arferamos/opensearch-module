resource "aws_opensearch_domain" "this" {
  domain_name    = var.domain_name
  engine_version = var.engine_version

  cluster_config {
    instance_type  = var.instance_type
    instance_count = var.instance_count
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https = true
  }

  dynamic "log_publishing_options" {
    for_each = var.enable_index_slow_logs ? [1] : []

    content {
      log_type                 = "INDEX_SLOW_LOGS"
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.index_slow[0].arn
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.enable_search_slow_logs ? [1] : []

    content {
      log_type                 = "SEARCH_SLOW_LOGS"
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.search_slow[0].arn
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.enable_application_logs ? [1] : []

    content {
      log_type                 = "ES_APPLICATION_LOGS"
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.application[0].arn
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.enable_audit_logs ? [1] : []

    content {
      log_type                 = "AUDIT_LOGS"
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.audit[0].arn
    }
  }

  tags = var.tags

  depends_on = [
    aws_cloudwatch_log_resource_policy.opensearch
  ]
}