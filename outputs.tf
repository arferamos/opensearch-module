output "domain_name" {
  description = "Nome do domínio OpenSearch"
  value       = aws_opensearch_domain.this.domain_name
}

output "domain_arn" {
  description = "ARN do domínio OpenSearch"
  value       = aws_opensearch_domain.this.arn
}

output "domain_endpoint" {
  description = "Endpoint do domínio OpenSearch"
  value       = aws_opensearch_domain.this.endpoint
}

output "dashboard_endpoint" {
  description = "Endpoint do OpenSearch Dashboards"
  value       = aws_opensearch_domain.this.dashboard_endpoint
}