#!/bin/bash

# Switch between blue and green deployments
current_version=$(kubectl get svc nodeapp-service -o=jsonpath='{.spec.selector.version}')

if [ "$current_version" == "blue" ]; then
  new_version="green"
else
  new_version="blue"
fi

# Update service selector
kubectl patch svc nodeapp-service -p "{\"spec\":{\"selector\":{\"version\":\"$new_version\"}}}"

echo "Switched from $current_version to $new_version"