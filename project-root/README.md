# AWS EKS Blue-Green Deployment Automation

## Features
- Terraform to create EKS Cluster
- Jenkins on Kubernetes
- Node.js App with Blue-Green Deployment
- CI/CD via GitHub Actions

## Usage
1. Set GitHub secrets for AWS and DockerHub
2. Run `bootstrap.sh` to initialize infrastructure
3. Push to `main` to trigger GitHub Action CI/CD

---
