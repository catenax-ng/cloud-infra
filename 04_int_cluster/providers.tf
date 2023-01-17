terraform {
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
