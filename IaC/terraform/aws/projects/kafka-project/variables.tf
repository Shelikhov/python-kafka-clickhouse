#=============================================
#               VARIABLES
#=============================================

variable "project_name" {
  default = "kafka"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "file_user_data_path" {
  default = "kafka-script.sh.tpl"
}

variable "ec2_file_ssh_id_rsa_path" {
  default = ""
}

variable "state_storage_type" {
  default = "s3"
}

variable "s3_bucket_name" {
  default = ""
}

variable "s3_key_path" {
  default = "terraform/projects/network_project"
}

variable "instance_max_count" {
  default = 1
}

variable "instance_min_count" {
  default = 1
}

variable "instance_desired_count" {
  default = 1
}

variable "instance_type" {
  default = "t2.small"
}

variable "instance_image_id" {
  default = "ami-0beaa649c482330f7"
}
