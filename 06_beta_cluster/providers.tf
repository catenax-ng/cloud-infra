terraform {
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "beta"
    key                  = "beta.tfstate"
  }
}

provider "azurerm" {
  features {}
}
