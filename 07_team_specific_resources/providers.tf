terraform {
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "team-specific"
    key                  = "team-specific.tfstate"
  }

  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 3.54.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.38.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.15.0"
    }
  }
}

provider "azurerm" {
  client_id       = var.provider_service_principal_client_id
  client_secret   = var.provider_service_principal_client_secret
  tenant_id       = var.provider_azure_tenant_id
  subscription_id = var.provider_azure_subscription_id
  features {}
}

provider "azuread" {
  tenant_id       = var.provider_azure_tenant_id
}

provider "vault" {
  address = "https://vault.demo.catena-x.net"
  token = var.provider_vault_token
}
