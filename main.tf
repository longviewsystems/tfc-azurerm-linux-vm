data "azurerm_subnet" "vm_subnet" {
  name                 = var.vm_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group_name
}

resource "random_id" "storage_account_id" {
  byte_length = 4
  prefix      = "servicenowvmdg"
}

# Create resource group for virtual machine
resource "azurerm_resource_group" "servicenow_vm_rg" {
  name     = "rg-${var.vm_name}-${terraform.workspace}"
  location = var.vm_resource_group_location
  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}
# Create public IPs
resource "azurerm_public_ip" "servicenow_vm_public_ip" {
  name                = "pip-${var.vm_name}"
  location            = var.vm_resource_group_location
  resource_group_name = azurerm_resource_group.servicenow_vm_rg.name
  allocation_method   = "Dynamic"
  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "servicenow_vm_nsg" {
  name                = "nsg-${var.vm_name}"
  location            = var.vm_resource_group_location
  resource_group_name = azurerm_resource_group.servicenow_vm_rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
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

# Create network interface
resource "azurerm_network_interface" "servicenow_vm_nic" {
  name                = "nic-${var.vm_name}"
  location            = var.vm_resource_group_location
  resource_group_name = azurerm_resource_group.servicenow_vm_rg.name

  ip_configuration {
    name                          = "${var.vm_name}_nic_configuration"
    subnet_id                     = data.azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.servicenow_vm_public_ip.id
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

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "servicenow_vm_storage_account" {
  name                     = "st${random_id.storage_account_id.hex}"
  location                 = var.vm_resource_group_location
  resource_group_name      = azurerm_resource_group.servicenow_vm_rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "servicenow_vm_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.servicenow_vm_nic.id
  network_security_group_id = azurerm_network_security_group.servicenow_vm_nsg.id
}
# Create virtual machine
resource "azurerm_linux_virtual_machine" "servicenow_vm" {
  name                  = "vm-${var.vm_name}"
  location              = var.vm_resource_group_location
  resource_group_name   = azurerm_resource_group.servicenow_vm_rg.name
  network_interface_ids = [azurerm_network_interface.servicenow_vm_nic.id]
  size                  = "Standard_DS1_v2"

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

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.servicenow_vm_storage_account.primary_blob_endpoint
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