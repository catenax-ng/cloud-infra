variable "resource_group_location" {
  description = "The Azure region location for the resource group. Should also be used to set the location of all other resources"
  type        = string
  default     = "germanywestcentral"
}

variable "sku_name" {
  description = "The Azure SKU name that is used by all resources that require the SKU setting"
  type = string
  default = "standard"
}

# Provider specific variables
variable "provider_service_principal_client_id" {
  description = "The service principal client id to authenticate to Azure"
  type        = string
}

variable "provider_service_principal_client_secret" {
  description = "The service principal client secret to authenticate to Azure"
  type        = string
}

variable "provider_azure_tenant_id" {
  description = "The Azure tenant ID use"
  type = string
}

variable "provider_azure_subscription_id" {
  description = "The Azure subscription ID"
}

variable "provider_vault_token" {
  description = "The token used to authenticate Hashicorp Vault requests"
  type = string
}
