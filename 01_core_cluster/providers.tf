terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.99.0"
      configuration_aliases = [azurerm.speedboat-sub]
    }
  }

  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "core"
    key                  = "core.tfstate"
  }
}

provider "azurerm" {
  client_id       = var.provider_service_principal_client_id
  client_secret   = var.provider_service_principal_client_secret
  tenant_id       = var.provider_azure_tenant_id
  subscription_id = var.provider_azure_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "speedboat-sub"
  client_id       = var.provider_service_principal_client_id
  client_secret   = var.provider_service_principal_client_secret
  tenant_id       = var.provider_azure_tenant_id
  subscription_id = var.provider_azure_dns_subscription_id
  features {}
}
