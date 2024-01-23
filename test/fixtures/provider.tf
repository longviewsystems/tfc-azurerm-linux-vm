terraform {
  required_version = ">=1.2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.88.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0.0, <4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}