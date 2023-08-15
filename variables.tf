variable "resource_group_location" {
  type        = string
  default     = "westus"
  description = "Location of the resource group."
}

variable "name" {
  type        = string
  description = "(Required) The name of the resource group. Must be unique on your Azure subscription"
  default     = "test-vm-rg-tfc"
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}