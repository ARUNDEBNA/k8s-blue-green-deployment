#!/bin/bash
cd terraform
terraform init
terraform apply -auto-approve

cd ../jenkins
./install_jenkins.sh

cd ../nodejs-app/k8s
kubectl apply -f deployment-green.yaml
kubectl apply -f service.yaml
