Project to deploy kafka project.

#=============================================
#               ATTENTION
# AWS charges for ec2 instance type (small): 0.023 USD per Hour
# Small type was selected according to the price and necessary resources for Kafka.
# instance_type parameter to change instance type in variables.tf file.
#=============================================

Prerequisites:
- to complete details about s3 bucket where will be terraform state in remote_state.tf file for the following parameters:
  - bucket
  - key
  - region
- to edit nessasery variables in variables.tf file
  - file_user_data_path
  - ec2_file_ssh_id_rsa_path
  - s3_bucket_name
