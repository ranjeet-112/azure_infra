
resource "azurerm_resource_group" "angel" {
  name     = var.resource_group_name
  location = var.location
}