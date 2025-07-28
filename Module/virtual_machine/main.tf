resource "azurerm_network_interface" "angel_nic" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    public_ip_address_id = azurerm_public_ip.angel_pip.id
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "angel_vm" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.virtual_machine_size
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.angel_nic.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  custom_data = base64encode(<<-EOT
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
EOT
  )
}