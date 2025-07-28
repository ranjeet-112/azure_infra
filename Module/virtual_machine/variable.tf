variable "network_interface_name" {
    description = "The name of the network interface."
    type        = string
}
variable "location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the virtual machine will be created."
  type        = string
}
variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}
variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_F2"
}
variable "image_publisher" {
  description = "The publisher of the virtual machine image."
  type        = string
  default     = "Canonical"
}
variable "image_offer" {
  description = "The offer of the virtual machine image."
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}
variable "image_sku" {
  description = "The SKU of the virtual machine image."
  type        = string
  default     = "22_04-lts"
}
variable "image_version" {
  description = "The version of the virtual machine image."
  type        = string
  default     = "latest"
}
