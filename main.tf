terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "b81184b6-b6fb-418c-bb14-883a13e7b3a8"
  client_id       = "dcae24e2-57fb-4e1a-a198-82baabf71d97"
  # client_secret = ""
  
  tenant_id       = "2aba1677-0a6d-4375-a981-3463ba909945"
}

# provider "azurerm" {
#   features {}
#   client_id     = var.client_id
#   client_secret = var.client_secret
#   subscription_id = var.subscription_id
#   tenant_id       = var.tenant_id
# }

# aks-terraform/main.tf

module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.26.6"
  service_principal_client_id = var.client_id
  service_principal_secret   = var.client_secret

  # Variables referencing output variables from the networking module
  resource_group_name        = module.networking.networking_resource_group_name
  vnet_id                    = module.networking.vnet_id
  control_plane_subnet_id    = module.networking.control_plane_subnet_id
  worker_node_subnet_id      = module.networking.worker_node_subnet_id
  aks_nsg_id                = module.networking.aks_nsg_id
}


