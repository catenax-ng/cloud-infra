terraform {
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "pre-prod"
    key                  = "pre-prod.tfstate"
  }
}

provider "azurerm" {
  features {}
}
