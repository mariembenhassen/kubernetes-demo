#!/bin/bash
set -e

NAME="kubernetes-demo-api"
USERNAME="mariembh"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

# echo "Pushing Docker image to Docker Hub..."
# docker push $IMAGE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
echo "Deployment complete."

echo "You can view the pods with:"
kubectl get pods

echo "And view the services with:"
kubectl get services

echo "Fetching the main service details..."
kubectl get services $NAME

echo "Opening the app in your browser..."
start http://localhost:32006
