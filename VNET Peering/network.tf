resource "azurerm_resource_group" "syedrg" {
  name = "sjrg"
  location = "canada central"
}

resource "azurerm_virtual_network" "vnet1" {
  name = "syedvnet1"
  address_space = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.syedrg.name
  location = azurerm_resource_group.syedrg.location
}

resource "azurerm_subnet" "sn1" {
  name = "syedsn1"
  address_prefixes = ["10.0.0.0/24"]
  resource_group_name = azurerm_resource_group.syedrg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
}

resource "azurerm_virtual_network" "vnet2" {
  name = "syedvnet2"
  address_space = ["10.1.0.0/16"]
  resource_group_name = azurerm_resource_group.syedrg.name
  location = azurerm_resource_group.syedrg.location
}

resource "azurerm_subnet" "sn2" {
  name = "syedsn2"
  address_prefixes = ["10.1.0.0/24"]
  resource_group_name = azurerm_resource_group.syedrg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
}

# resource "azurerm_virtual_network_peering" "peer1" {
#   name = "syedpeer1"
#   virtual_network_name = azurerm_virtual_network.vnet1.name
#   resource_group_name = azurerm_resource_group.syedrg.name
#   remote_virtual_network_id = azurerm_virtual_network.vnet2.id
# }

# resource "azurerm_virtual_network_peering" "peer2" {
#   name = "syedpeer2"
#   virtual_network_name = azurerm_virtual_network.vnet2.name
#   resource_group_name = azurerm_resource_group.syedrg.name
#   remote_virtual_network_id = azurerm_virtual_network.vnet1.id
# }