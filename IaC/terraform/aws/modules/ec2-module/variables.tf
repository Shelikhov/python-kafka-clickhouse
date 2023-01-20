#=============================================
#               VARIABLES
#=============================================

### Common ###

variable "project_name" {
  default = "ec2-server"
}

variable "tags" {
  type = map(any)
  default = {
    project_name = "ec2_server"
    environment  = "dev"
  }
}



### Network Dependencies ###

variable "state_storage_type" {
  default = "s3"
}

variable "s3_bucket_name" {
  default = ""
}

variable "s3_key_path" {
  default = ""
}

variable "aws_region" {
  default = "us-east-2"
}



### Security Group ###

variable "sg_ingress_rules" {
  default = [
    {
      port        = 0
      protocol    = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_egress_rules" {
  default = [
    {
      port        = 0
      protocol    = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_name_prefix_length" {
  default = 5
}



### EC2 Instance ###

variable "instance_image_id" {
  default = "ami-0f924dc71d44d23e2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_max_count" {
  default = 3
}

variable "instance_min_count" {
  default = 1
}

variable "instance_desired_count" {
  default = 2
}

variable "ec2_file_ssh_id_rsa_path" {
  default = ""
}

variable "file_user_data" {
  default = ""
}
