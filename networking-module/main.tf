resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}
# resource "azurerm_resource_group" "aks" {
#   name     = "aks-resources"
#   location = "UK South" # Change this to your desired region.
# }

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
}

resource "azurerm_subnet" "aks_control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes    = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "aks_worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes    = ["10.0.2.0/24"]
}

resource "azurerm_resource_group" "aks" {
  name     = "aks-resources"
  location = "UK South" # Change this to your desired region.
}

resource "azurerm_network_security_group" "aks_nsg" {
  name = "aks-nsg"
  resource_group_name = azurerm_resource_group.aks_rg.name
   location            = azurerm_resource_group.aks.location

   security_rule {
    name                       = "kube-apiserver-rule"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6443"
    source_address_prefix      = "92.29.247.146/32"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "ssh-rule"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "92.29.247.146/32"
    destination_address_prefix = "*"
  }
}

