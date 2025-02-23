#!/bin/bash

# Set variables for the YAML files
DEPLOYMENT_YAML="chatapp-deployment.yaml"
SERVICE_YAML="chatapp-svc.yaml"
CONFIGMAP_YAML="chatapp-configmap.yaml"
HPA_YAML="chatapp-hpa.yaml"

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found. Please install kubectl to proceed."
    exit 1
fi

# Apply the resources in the specified order
echo "Applying Deployment..."
kubectl apply -f $DEPLOYMENT_YAML
if [ $? -eq 0 ]; then
    echo "Deployment applied successfully."
else
    echo "Failed to apply Deployment."
    exit 1
fi

echo "Applying Service..."
kubectl apply -f $SERVICE_YAML
if [ $? -eq 0 ]; then
    echo "Service applied successfully."
else
    echo "Failed to apply Service."
    exit 1
fi

echo "Applying ConfigMap..."
kubectl apply -f $CONFIGMAP_YAML
if [ $? -eq 0 ]; then
    echo "ConfigMap applied successfully."
else
    echo "Failed to apply ConfigMap."
    exit 1
fi

echo "Applying Horizontal Pod Autoscaler..."
kubectl apply -f $HPA_YAML
if [ $? -eq 0 ]; then
    echo "Horizontal Pod Autoscaler applied successfully."
else
    echo "Failed to apply Horizontal Pod Autoscaler."
    exit 1
fi

# Output status of the resources
echo "Checking the status of resources..."
kubectl get deployments
kubectl get services
kubectl get configmaps
kubectl get hpa

echo "All resources applied successfully."