terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "saipriya"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                = "saipriyaregistry"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
