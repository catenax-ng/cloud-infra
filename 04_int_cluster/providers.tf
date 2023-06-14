terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 3.0"
      configuration_aliases = [azurerm.default, azurerm.speedboat]
    }
  }
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "int"
    key                  = "int.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "default"
  client_id       = var.provider_service_principal_client_id
  client_secret   = var.provider_service_principal_client_secret
  tenant_id       = var.provider_azure_tenant_id
  subscription_id = var.provider_azure_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "speedboat"
  client_id       = var.provider_service_principal_client_id
  client_secret   = var.provider_service_principal_client_secret
  tenant_id       = var.provider_azure_tenant_id
  subscription_id = var.provider_azure_dns_subscription_id
  features {}
}
