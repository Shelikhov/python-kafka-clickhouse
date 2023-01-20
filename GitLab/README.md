# Pipeline to build and deploy python application on the Minikube located in AWS.

Components:
 - deployment (consiste of manifest files to deploy application on the k8s (in this case Minikube) cluster)
 - docker-context (Docker context with Dockerfile and source code in form of the python script)
 - cicd (templates for .gitlab file)

Prerequisites:
 - to set variables for this pipeline in GitLab settings Variables section such as for dev environment:
		DOCKER_PASS 		# Docker registry password
		DOCKER_USER			# Docker registry user
		EC2_SSH_KEY_PASS	# Password for ansible-vault to decrypt id_rsa ssh key file to access to the ec2 instance with Minikube
 - encrypted ssh id_rsa key (generated ssh private key to access to the Minikube EC2 instance), temporary located in python-kaka-clickhouse dir (for testing)
 - to set variables in the .gitlab-ci.yml file
 - to set variables in deployment/configmap.yaml file to integrate with Kafka
 - to set image version in deployment/deployment.yaml file
