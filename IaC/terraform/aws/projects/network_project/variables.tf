#=====================================
#           VARIABLES
#=====================================

variable "aws_region" {
  default = "us-east-2"
}

variable "project_name" {
  default = "python_app"
}

variable "tags" {
  type = map(any)
  default = {
    project_name = "python_app"
    environment  = "dev"
  }
}

variable "public_subnets" {
  default = ["10.0.0.0/20"]
}

variable "private_subnets" {
  default = ["10.0.16.0/20"]
}
