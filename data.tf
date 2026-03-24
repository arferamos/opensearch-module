# Busca todas as VPCs
data "aws_vpcs" "all" {}

# Busca a VPC padrão (primeiro resultado ou outro critério)
data "aws_vpc" "vpc_default" {
  id = data.aws_vpcs.all.vpcs[0]  # ou outro critério
}

# Busca subnets dessa VPC
data "aws_subnets" "subnets_default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_default.id]
  }
}

# Outputs
output "vpc_id" {
  value = data.aws_vpc.vpc_default.id
}

output "subnet_ids" {
  value = data.aws_subnets.subnets_default.ids
}