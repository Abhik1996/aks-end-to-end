Overview
The project is organized into two modules:

Networking Module: Responsible for setting up the networking infrastructure required by the AKS cluster.
AKS Cluster Module: Provisions the AKS cluster, specifying its configuration and dependencies.
Getting Started
Prerequisites
Terraform installed on your local machine.
Azure CLI configured and authenticated.
Installation
Clone the repository:
git clone <repository_url>
cd aks-terraform
Initialize the networking module:

cd networking-module
terraform init

Initialize the cluster module:
cd ../aks-cluster-module
terraform init
Configuration
Networking Module
Input Variables:
resource_group_name: Name of the Azure Resource Group for networking resources.
location: Azure region where networking resources will be deployed.
vnet_address_space: Address space for the Virtual Network (VNet).
AKS Cluster Module
Input Variables:
aks_cluster_name: Name of the AKS cluster.
cluster_location: Azure region where the AKS cluster will be deployed.
dns_prefix: DNS prefix of the AKS cluster.
kubernetes_version: Kubernetes version for the AKS cluster.
service_principal_client_id: Client ID for the service principal associated with the AKS cluster.
service_principal_secret: Client Secret for the service principal associated with the AKS cluster.
resource_group_name: Name of the Azure Resource Group for networking resources.
vnet_id: ID of the Virtual Network (VNet).
control_plane_subnet_id: ID of the control plane subnet.
worker_node_subnet_id: ID of the worker node subnet.
Usage
Modify the variables.tf files in both modules to customize your AKS cluster and networking configuration.

Apply the changes:

cd networking-module
terraform apply
cd ../aks-cluster-module
terraform apply
Outputs
Networking Module:

vnet_id: ID of the Virtual Network (VNet).
control_plane_subnet_id: ID of the control plane subnet.
worker_node_subnet_id: ID of the worker node subnet.
AKS Cluster Module:

aks_cluster_name: Name of the provisioned AKS cluster.
aks_cluster_id: ID of the provisioned AKS cluster.
aks_kubeconfig: Kubernetes configuration file for the AKS cluster.