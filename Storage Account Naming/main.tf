locals {
  formatted_name = lower(replace(var.project_name, " ", "-"))
  merge_tags = merge(var.default_tags,var.environment_tags)
  storage_formatted = replace(replace(lower(substr(var.storage_account_name,0,23)), " ", ""), "!","")
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.formatted_name}-rg"
  location = "West Europe"

  tags = local.merge_tags
}

resource "azurerm_storage_account" "example" {
  name                     = local.storage_formatted
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.merge_tags
}

output "rgdemo" {
  value = azurerm_resource_group.rg
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name  
}