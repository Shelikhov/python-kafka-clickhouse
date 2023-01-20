#!/bin/bash

#======================================================
#               Script to prepare Kubernetes
#======================================================
#Components:
# - Docker
# - Minikube
# - kubectl
# - Git


# To install container manager (driver to launch Kubernetes - minikube), such as: Docker.
sudo amazon-linux-extras install docker -y
sudo systemctl start docker

# For security reasons, to add ec2-user user to the docker group
sudo usermod -aG docker ec2-user

# To download and check kubectl utilite to use kubernetes.
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# To install Git to get repository with manifests.
sudo yum install git -y

# To download, install and launch minikube from the ec2-user user (not from root).
runuser -l  ec2-user -c 'curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo install minikube-linux-amd64 /usr/local/bin/minikube && minikube start --driver=docker --listen-address=0.0.0.0 --apiserver-ips=`curl http://169.254.169.254/latest/meta-data/public-ipv4`'
