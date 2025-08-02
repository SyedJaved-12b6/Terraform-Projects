resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-resources"
  location = var.allowed_locations[0]
}

resource "azurerm_storage_account" "example" {
#   count = length(var.storageaccountname)
#   name                     = var.storageaccountname[count.index]
  for_each = var.storageaccountname
  name = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}