# aks-terraform/variables.tf



variable "client_id" {
  description = "Azure service principal client ID"
}

variable "client_secret" {
  description = "Azure service principal client secret"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  default     = "your_subscription_id"  # Replace with your actual subscription ID or provide it via environment variable
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  default     = "your_tenant_id"  # Replace with your actual tenant ID or provide it via environment variable
}

variable "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG)"
  type        = string
}
