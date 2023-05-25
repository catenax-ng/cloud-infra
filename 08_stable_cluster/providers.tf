terraform {
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "stable"
    key                  = "stable.tfstate"
  }
}

provider "azurerm" {
  features {}
}
