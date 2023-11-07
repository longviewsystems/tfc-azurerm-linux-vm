variable "vm_username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureuser"
}
  
variable "vnet_name" {
  type        = string
  description = "The password for the local account that will be created on the new VM."
  default     = "myVnet"
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Name of the vNet's resource group."
  default     = "myResourceGroup"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet."
  default     = "mySubnet"
}

variable "vm_resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "eastus"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine."
  default     = "myVM"
}

variable "location" {
  type        = string
  description = "Location used to deploy the resources"
  default     = "eastus"
}

variable "vm_password" {
  type        = string
  description = "The password for the local account that will be created on the new VM."
  sensitive   = true
  default     = ""
}
  
variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default = {
    environment = "test"
    managed_by  = "terratest"
  }
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
  default     = "Standard_DS1_v2"
  
}