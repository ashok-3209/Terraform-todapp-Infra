terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    tenant_id            = "0cd94da3-6ea1-4939-8630-bd60916b12c2"
    resource_group_name  = "dev-rg-ashok"
    storage_account_name = "devaskstg001"
    container_name       = "dev-container"
    key                  = "dev1.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "f0ea4d91-8845-4cde-80fa-52ca5703a10a"
}