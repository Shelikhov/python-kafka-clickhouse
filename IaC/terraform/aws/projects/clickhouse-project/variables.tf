#=============================================
#               VARIABLES
#=============================================

variable "project_name" {
  default = "clickhouse"
}

variable "aws_region" {
  default = "us-east-2"
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

variable "s3_kafka_key_path" {
  default = "terraform/projects/kafka_project"
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
  default = "t2.micro"
}

variable "instance_image_id" {
  default = "ami-0f924dc71d44d23e2"
}
