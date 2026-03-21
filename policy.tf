resource "aws_cloudwatch_log_resource_policy" "opensearch" {
  policy_name = "${var.domain_name}-opensearch-log-policy"

  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowOpenSearchServiceToWriteLogs"
        Effect = "Allow"
        Principal = {
          Service = "es.amazonaws.com"
        }
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = concat(
          var.enable_index_slow_logs ? ["${aws_cloudwatch_log_group.index_slow[0].arn}:*"] : [],
          var.enable_search_slow_logs ? ["${aws_cloudwatch_log_group.search_slow[0].arn}:*"] : [],
          var.enable_application_logs ? ["${aws_cloudwatch_log_group.application[0].arn}:*"] : [],
          var.enable_audit_logs ? ["${aws_cloudwatch_log_group.audit[0].arn}:*"] : []
        )
      }
    ]
  })
}