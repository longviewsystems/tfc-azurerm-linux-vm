# The main configuration file where all the resources are defined

data "azurerm_subnet" "vm_subnet" {
  name                 = var.vm_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group_name
}

# Creates a network interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-${var.vm_name}"
  location            = var.vm_resource_group_location
  resource_group_name = var.vnet_resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}_nic_configuration"
    subnet_id                     = data.azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}

# Creates a Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-${var.vm_name}"
  location              = var.vm_resource_group_location
  resource_group_name   = var.vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                  = var.vm_size

  os_disk {
    name                 = "osdisk-${var.vm_name}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = var.vm_name
  admin_username                  = var.vm_username
  admin_password                  = var.vm_password
  disable_password_authentication = false

  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}