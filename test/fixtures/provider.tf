terraform {
  required_version = ">=1.0.11"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.86.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}