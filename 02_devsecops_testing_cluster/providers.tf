terraform {
  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "devsecops-testing"
    key                  = "devsecops-testing.tfstate"
  }
}

provider "azurerm" {
  features {}
}
