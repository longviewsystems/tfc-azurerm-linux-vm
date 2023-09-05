variable "vnet_name" {
  type = string
}

variable "vm_subnet_name" {
  type        = string
  description = "Name of the subnet."
}

variable "vm_resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Name of the vNet's resource group."
}

variable "vm_username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
}

variable "vm_password" {
  type        = string
  description = "The password for the local account that will be created on the new VM."
  sensitive   = true
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine."
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to all resources."
  default     = {}
}

