#=============================================
#         Terraform state storage
#=============================================

terraform {
  backend "s3" {
    bucket = ""
    key    = "terraform/projects/kafka_project"
    region = "us-east-2"
  }
}
