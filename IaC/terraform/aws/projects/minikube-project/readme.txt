Project to deploy minikube project.

#=============================================
#               ATTENTION
# AWS charges for ec2 instance type (medium): 0.0464 USD per Hour
# Medium type was selected according to necessary resources for Minikube:
# 	- 2 CPUs or more
# 	- 2GB of free memory
# 	- 20GB of free disk space
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
