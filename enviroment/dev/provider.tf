terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
 backend "azurerm" {
     tenant_id        = "ba464e9e-9154-4fc0-9582-760e55463849"  
     subscription_id  = "cefa80e5-9af0-4e4a-9f43-e0a0491a5473" 
     resource_group_name  = "dev-rg-ask01"
     storage_account_name = "devstgask01"
     container_name       = "tfstate-container"
     key                  = "aks.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cefa80e5-9af0-4e4a-9f43-e0a0491a5473"
   resource_provider_registrations = "none"
}