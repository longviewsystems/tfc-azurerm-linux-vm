output "resource_group_name" {
  value = azurerm_resource_group.servicenow_rg.name
}
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.servicenow_vm.public_ip_address
}

output "private_ip_address" {
  value = azurerm_linux_virtual_machine.servicenow_vm.private_ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.servicenow_vm.virtual_machine_id
}
output "id" {
  value = azurerm_linux_virtual_machine.servicenow_vm.id
}