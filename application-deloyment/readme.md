
# Kubernetes Deployment for Flask Web Application

This repository contains Kubernetes manifests and instructions for deploying a Flask web application on Azure Kubernetes Service (AKS).

## Deployment Manifests

The deployment manifests define the resources required to deploy the Flask web application on AKS. These manifests include:

- **Deployment**: Manages the deployment of the Flask application, ensuring scalability and high availability.
- **Service**: Facilitates internal communication within the AKS cluster, directing traffic to the appropriate pods.

Manifest files:
- `application-manifest.yaml`: Contains the Deployment and Service manifests.

## Deployment Strategy

The chosen deployment strategy is Rolling Updates. This strategy allows for seamless updates to the application while maintaining availability. During updates, only one pod becomes temporarily unavailable, ensuring minimal disruption to users.

## Testing and Validation

To test the deployed application:

1. Verify the status of pods and services:
   ```sh
   kubectl get pods
   kubectl get services
Initiate port forwarding to access the application locally:

sh
Copy code
kubectl port-forward <pod-name> 5000:5000
Access the application locally at http://127.0.0.1:5000 and thoroughly test its functionality.