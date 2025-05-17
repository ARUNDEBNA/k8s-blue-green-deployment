#!/bin/bash

#!/bin/bash

# Configure AWS credentials
aws configure set region $AWS_REGION
aws sts assume-role-with-web-identity \
  --role-arn $AWS_IAM_ROLE \
  --role-session-name "JenkinsDeploy" \
  --web-identity-token file://$GITHUB_WORKFLOW_TOKEN > /tmp/creds

export AWS_ACCESS_KEY_ID=$(jq -r .Credentials.AccessKeyId /tmp/creds)
export AWS_SECRET_ACCESS_KEY=$(jq -r .Credentials.SecretAccessKey /tmp/creds)
export AWS_SESSION_TOKEN=$(jq -r .Credentials.SessionToken /tmp/creds)

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