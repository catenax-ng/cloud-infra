terraform {
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "dev"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}
