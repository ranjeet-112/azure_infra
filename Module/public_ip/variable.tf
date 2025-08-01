variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
}
variable "location" {
  description = "The Azure region where the public IP address will be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the public IP address will be created."
  type        = string
}
variable "allocation_method" {
  description = "The allocation method for the public IP address (Static or Dynamic)."
  type        = string
  default     = "Dynamic"
}
