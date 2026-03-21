locals {
  log_group_names = {
    index_slow  = "/aws/opensearch/${var.domain_name}/index-slow-logs"
    search_slow = "/aws/opensearch/${var.domain_name}/search-slow-logs"
    application = "/aws/opensearch/${var.domain_name}/application-logs"
    audit       = "/aws/opensearch/${var.domain_name}/audit-logs"
  }
}