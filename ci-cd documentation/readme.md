# CI/CD Pipeline Documentation

This repository contains the source code and configuration for the CI/CD pipeline used to automate the build, testing, and deployment processes for the Flask web application to Azure Kubernetes Service (AKS).

## Project Overview

The project consists of the following components:

- **Flask Web Application**: A web application built using Flask, designed to serve as an internal tool for the organization's employees.

- **Azure DevOps Pipeline**: A CI/CD pipeline configured in Azure DevOps to automate the build, testing, and deployment of the Flask application to the AKS cluster.

## CI/CD Pipeline Configuration

The CI/CD pipeline is configured with the following stages:

1. **Build Stage**:
   - Builds the Docker image for the Flask application.
   - Pushes the Docker image to Docker Hub.
   
2. **Deploy Stage**:
   - Deploys the application to AKS using Kubernetes manifests.
   - Utilizes service connections to Docker Hub and AKS for seamless integration.

## Pipeline Triggers

The pipeline is triggered automatically on each push to the `main` branch of the GitHub repository. Additionally, manual triggers can be initiated as needed.

## Testing and Validation

To validate the functionality of the deployed application:

1. **Monitor Pod Status**: Ensure that pods are created correctly within the AKS cluster after deployment.

2. **Port Forwarding**: Initiate port forwarding using `kubectl` to securely access the application running on AKS locally.

3. **Functional Testing**: Test the application functionality, including critical features such as the orders table and Add Order functionality, to ensure proper operation.

## Documentation Updates

The README.md file is regularly updated with comprehensive information about the CI/CD pipeline setup, including specific configurations, settings, validation steps, and encountered issues during the deployment process.

## Additional Notes

- **Security**: Ensure that all sensitive information, such as access tokens and credentials, are securely managed and stored.
- **Monitoring**: Implement monitoring and logging solutions to track the performance and health of the deployed application.
- **Scaling**: Configure auto-scaling policies within AKS to handle fluctuations in application load efficiently.
