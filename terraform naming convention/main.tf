locals {
  formatted_name = lower(replace(var.project_name, " ", "-"))
}

resource "azurerm_resource_group" "rg" {
  name     = local.formatted_name
  location = "West Europe"
}