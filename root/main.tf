module "resource_group1" {
  source = "../Module/resource_group"

  resource_group_name = "rg_craft"
  location            = "Central India"
}

module "resource_group2" {
  source = "../Module/resource_group"

  resource_group_name = "rg_cronzone"
  location            = "East US"
}

module "key_vault" {
depends_on = [ module.resource_group2 ]
  source = "../Module/key_vault"

  key_vault_name       = "kv_craft"
  location             = "central india"
  resource_group_name  = "rg_cronzone"
}

module "virtual_network" {
depends_on = [ module.resource_group1, module.resource_group2 ]
  source = "../Module/virtual_network"

  resource_group_name = "rg_craft"
  location            = "central india"
  virtual_network_name = "vnet_craft"
  address_space = ["192.168.0.0/16"]

}

module "fronted_subnet" {
depends_on = [ module.virtual_network ]
  source = "../Module/sub_net"

  resource_group_name = "rg_craft"
  virtual_network_name = "vnet_craft"
  subnet_name         = "subnet_craft"
  address_prefixes    = ["192.168.0.0/24"]
}

module "backend_subnet" {
depends_on = [ module.virtual_network ]
  source = "../Module/sub_net"

  resource_group_name = "rg_cronzone"
  virtual_network_name = "vnet_craft"
  subnet_name         = "subnet_cronzone"
  address_prefixes    = ["192.168.1.0/24"]

}

