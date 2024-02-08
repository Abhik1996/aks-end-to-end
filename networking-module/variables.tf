# # networking-module/variables.tf

# variable "resource_group_name" {
#   type        = string
#   description = "Name of the Azure Resource Group where networking resources will be deployed"
#   default     = "myResourceGroup"
# }

# variable "location" {
#   type        = string
#   description = "Azure region where networking resources will be deployed"
#   default     = "UK SOUTH"
# }

# variable "vnet_address_space" {
#   type        = list(string)
#   description = "Address space for the Virtual Network (VNet)"
#   default     = ["10.0.0.0/16"]
# }


# networking-module/variables.tf

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group for networking resources"
  default     = "myResourceGroup"
}

variable "location" {
  type        = string
  description = "Azure region for networking resources deployment"
  default     = "UK SOUTH"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network (VNet)"
  default     = ["10.0.0.0/16"]
}
