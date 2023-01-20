#=============================================
#               DEPENDENCIES
#=============================================

data "terraform_remote_state" "kafka" {
  backend = var.state_storage_type
  config = {
    bucket = var.s3_bucket_name
    key    = var.s3_kafka_key_path
    region = var.aws_region
  }
}

data "aws_network_interface" "kafka_network_interface" {
  id = data.terraform_remote_state.kafka.outputs.instance_network_interface_id
}

data "template_file" "user_data_vars" {
  template = file("clickhouse-script.sh.tpl")
  vars = {
    kafka_private_ip = "${data.aws_network_interface.kafka_network_interface.private_ip}"
  }
}
