#!/bin/bash

# Add Jenkins Helm repo
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

# Install Jenkins
helm upgrade --install jenkins jenkinsci/jenkins \
  --namespace jenkins \
  --create-namespace \
  --values values.yaml \
  --wait

# Get Jenkins admin password
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo