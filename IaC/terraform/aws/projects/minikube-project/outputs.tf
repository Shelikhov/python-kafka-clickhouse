#=============================================
#               OUTPUT
#=============================================

output "aws_region" {
  value = var.aws_region
}

output "availability-zones" {
  value = module.minikube_project.availability-zones
}

output "security_group_name" {
  value = module.minikube_project.security_group_name
}

output "launch_template" {
  value = module.minikube_project.launch_template
}

output "autoscaling_group_id" {
  value = module.minikube_project.autoscaling_group_id
}
