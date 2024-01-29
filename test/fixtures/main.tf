# Setup module for testing

# Naming conventions
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"
  prefix  = ["mod", "test"]
  # suffix = random_string.random.value

  unique-include-numbers = false
  unique-length          = 4
}

# Resource Group
resource "azurerm_resource_group" "fixtures" {
  name     = module.naming.resource_group.name_unique
  location = var.location
  tags     = var.tags
}

# Virtual Network
resource "azurerm_virtual_network" "fixtures" {
  name                = module.naming.virtual_network.name_unique
  address_space       = ["10.30.0.0/16"]
  location            = azurerm_resource_group.fixtures.location
  resource_group_name = azurerm_resource_group.fixtures.name
  tags                = var.tags
}

# Subnet
resource "azurerm_subnet" "fixtures_sn1" {
  name                 = "sn1"
  resource_group_name  = azurerm_resource_group.fixtures.name
  virtual_network_name = azurerm_virtual_network.fixtures.name
  address_prefixes     = ["10.30.1.0/24"]

}

# Network Interface
resource "azurerm_network_interface" "fixtures" {
  name                = module.naming.network_interface.name_unique
  location            = azurerm_resource_group.fixtures.location
  resource_group_name = azurerm_resource_group.fixtures.name

  ip_configuration {
    name                          = "test-ip-configuration"
    subnet_id                     = azurerm_subnet.fixtures_sn1.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "fixtures" {
  name                = module.naming.virtual_machine.name_unique
  location            = azurerm_resource_group.fixtures.location
  resource_group_name = azurerm_resource_group.fixtures.name
  size                = "Standard_B1s"
  network_interface_ids = [
    azurerm_network_interface.fixtures.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  computer_name                   = "terratest-vmname"
  admin_username                  = "linuxadmin"
  admin_password                  = "P@SsW0rd1234"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}