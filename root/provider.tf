terraform {
  backend "azurerm" {
    resource_group_name  = "rg_craft"
    storage_account_name = "tfstatecraft"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b2744a0d-e7f7-4cea-af52-689c2e4a2c69"
}