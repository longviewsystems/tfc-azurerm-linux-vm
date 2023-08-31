variable "vnet_name" {
  type        = string
  description = "Name of the virtual network."
  default     = "vnetdemo"
}

variable "vm_subnet_name" {
  type        = string
  description = "Name of the subnet."
  default     = "subnetdemo"
}


variable "resource_group_location" {
  type        = string
  default     = "westus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
  default     = "rgdemo"
}
variable "vm_username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}
variable "vm_password" {
  type        = string
  description = "The password for the local account that will be created on the new VM."

}
variable "vmname" {
  type        = string
  description = "Name of the virtual machine."
  default     = "vmdemo"
}
