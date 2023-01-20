#=============================================
#               OUTPUT
#=============================================

output "aws_region" {
  value = var.aws_region
}

output "availability-zones" {
  value = module.clickhouse_project.availability-zones
}

output "security_group_name" {
  value = module.clickhouse_project.security_group_name
}

output "launch_template" {
  value = module.clickhouse_project.launch_template
}

output "autoscaling_group_id" {
  value = module.clickhouse_project.autoscaling_group_id
}

output "kafka_private_ip" {
  value = data.aws_network_interface.kafka_network_interface.private_ip
}
