#!/bin/bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm upgrade --install jenkins jenkins/jenkins -f values.yaml --namespace jenkins --create-namespace
