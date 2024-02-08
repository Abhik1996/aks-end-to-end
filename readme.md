# Azure Kubernetes Service (AKS) Terraform Project

This Terraform project automates the provisioning of an Azure Kubernetes Service (AKS) cluster and its associated networking infrastructure using Infrastructure as Code (IaC).

## Overview

The project is structured into modules for networking and AKS cluster provisioning. It follows the best practices of separating concerns and modularity.

## Getting Started

### Prerequisites

Before you begin, make sure you have:

- [Terraform](https://www.terraform.io/downloads.html) installed locally.
- Azure CLI configured with appropriate permissions.
- Azure Service Principal created for authentication.

### Configuration

1. **Azure Provider Setup**:

   Create a `main.tf` file in the main project directory (`aks-terraform`) and define the Azure provider block to enable authentication. Remember to define input variables for `client_id` and `client_secret` in a `variables.tf` file.

   provider "azurerm" {
     features {}
     client_id           = var.client_id
     client_secret       = var.client_secret
     subscription_id     = var.subscription_id
     tenant_id           = var.tenant_id
   }
Environment Variables:

Set environment variables for client_id, client_secret, subscription_id, and tenant_id to securely store your Azure credentials.

export ARM_CLIENT_ID="<Your_Client_ID>"
export ARM_CLIENT_SECRET="<Your_Client_Secret>"
export ARM_SUBSCRIPTION_ID="<Your_Subscription_ID>"
export ARM_TENANT_ID="<Your_Tenant_ID>"
Networking Module Integration:

Integrate the networking module in main.tf with required input variables.

module "networking" {
  source = "./networking-module"

  resource_group_name = "networking-resource-group"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]
}
Cluster Module Integration:

Integrate the cluster module in main.tf with required input variables.

module "aks_cluster" {
  source = "./aks-cluster-module"

  cluster_name              = "terraform-aks-cluster"
  location                  = "UK South"
  dns_prefix                = "myaks-project"
  kubernetes_version        = "1.26.6"
  service_principal_client_id     = var.client_id
  service_principal_secret = var.client_secret
  
  resource_group_name       = module.networking.networking_resource_group_name
  vnet_id                   = module.networking.vnet_id
  control_plane_subnet_id   = module.networking.control_plane_subnet_id
  worker_node_subnet_id     = module.networking.worker_node_subnet_id
  aks_nsg_id                = module.networking.aks_nsg_id
}
Applying Configuration
Initialize Terraform:

terraform init
Plan Infrastructure:
terraform plan
Apply Configuration:
terraform apply
