## Overview

This module provisions a Linux virtual machine in Azure for ServiceNow + TF Cloud integration demo.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.11 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.86.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.86.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vm_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_subnet.vm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources. | `map(string)` | `{}` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine. | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | The password for the local account that will be created on the new VM. | `string` | n/a | yes |
| <a name="input_vm_resource_group_location"></a> [vm\_resource\_group\_location](#input\_vm\_resource\_group\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size of the virtual machine. | `string` | n/a | yes |
| <a name="input_vm_subnet_name"></a> [vm\_subnet\_name](#input\_vm\_subnet\_name) | Name of the subnet. | `string` | n/a | yes |
| <a name="input_vm_username"></a> [vm\_username](#input\_vm\_username) | The username for the local account that will be created on the new VM. | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the vNet. | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | Name of the vNet's resource group. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | the ID of the VM |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | the private IP address of the VM |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | the public IP address of the VM |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | the name of the resource group where the VM gets created |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | the ID of the newly created VM |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->