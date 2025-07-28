resource "azurerm__virtual_network" "angel" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}


