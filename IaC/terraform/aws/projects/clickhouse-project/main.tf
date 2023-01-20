#=============================================
#               CLICKHOUSE PROJECT
#=============================================

provider "aws" {
  region = var.aws_region
}

locals {
  kafka_private_ip = data.aws_network_interface.kafka_network_interface.private_ip
}

module "clickhouse_project" {
  source                   = "git@github.com:EvgeniiShelikhov/python-kafka-clickhouse.git//IaC/terraform/aws/modules/ec2-module?ref=master"
  project_name             = var.project_name
  file_user_data           = base64encode(data.template_file.user_data_vars.rendered)
  ec2_file_ssh_id_rsa_path = var.ec2_file_ssh_id_rsa_path
  state_storage_type       = var.state_storage_type
  s3_bucket_name           = var.s3_bucket_name
  s3_key_path              = var.s3_key_path
  aws_region               = var.aws_region
  instance_desired_count   = var.instance_desired_count
  instance_min_count       = var.instance_min_count
  instance_max_count       = var.instance_max_count
  instance_type            = var.instance_type
  instance_image_id        = var.instance_image_id
}
