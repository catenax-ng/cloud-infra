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

variable "provider_azure_dns_subscription_id" {
  description = "The Azure subscription ID for the DNS entries. Only used, because DNS zone and AKS resources are in different subscriptions"
  type = string
}
