output "resource_group_name" {
  description = "the name of the resource group where the VM gets created"
  value       = var.vnet_resource_group_name
}

output "public_ip_address" {
  description = "the public IP address of the VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "private_ip_address" {
  description = "the private IP address of the VM"
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "vm_id" {
  description = "the ID of the newly created VM"
  value       = azurerm_linux_virtual_machine.vm.virtual_machine_id
}

# output "id" {
#   description = "the ID of the VM"
#   value       = azurerm_linux_virtual_machine.vm.id
# }