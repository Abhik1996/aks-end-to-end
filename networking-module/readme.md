AKS Terraform Project
This Terraform project automates the provisioning of Azure Networking Services for an Azure Kubernetes Service (AKS) cluster using Infrastructure as Code (IaC).

Overview
This project is organized into two modules:

Networking Module: Responsible for provisioning Azure networking resources required by the AKS cluster, including Virtual Network (VNet), subnets, and Network Security Group (NSG).
AKS Cluster Module: Handles the creation of the AKS cluster itself, configuring it to use the networking resources provisioned by the Networking Module.
Getting Started
Prerequisites
Before you begin, ensure you have:

Terraform installed on your local machine.
Azure CLI configured and authenticated.
Installation
Clone the repository:

git clone <repository_url>
cd aks-terraform

Initialize the networking module:
cd networking-module
terraform init
Configuration
Networking Module
Input Variables:
resource_group_name: Name of the Azure Resource Group where networking resources will be deployed.
location: Azure region where networking resources will be deployed.
vnet_address_space: Address space for the Virtual Network (VNet).
AKS Cluster Module
Input Variables:
Variables will be defined in the AKS Cluster Module based on the networking resources created.
Usage
Modify the input variables in the variables.tf files in both modules to customize your configuration.

Apply the changes:

cd networking-module
terraform apply
Outputs
Networking Module:

vnet_id: ID of the Virtual Network (VNet).
control_plane_subnet_id: ID of the control plane subnet.
worker_node_subnet_id: ID of the worker node subnet.
networking_resource_group_name: Name of the Azure Resource Group for networking resources.
aks_nsg_id: ID of the Network Security Group (NSG).
AKS Cluster Module:

Output variables will be defined in the AKS Cluster Module based on the AKS cluster resources provisioned.