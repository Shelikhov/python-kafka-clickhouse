#=============================================
#               OUTPUT
#=============================================

output "aws_region" {
  value = var.aws_region
}

output "availability-zones" {
  value = module.kafka_project.availability-zones
}

output "security_group_name" {
  value = module.kafka_project.security_group_name
}

output "launch_template" {
  value = module.kafka_project.launch_template
}

output "autoscaling_group_id" {
  value = module.kafka_project.autoscaling_group_id
}

output "instance_network_interface_id" {
  value = module.kafka_project.instance_network_interface_id
}

#output "instance_public_ip" {
#  value = module.kafka_project.instance_public_ip
#}
