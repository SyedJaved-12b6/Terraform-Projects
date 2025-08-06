locals {
  formatted_name = lower(replace(var.project_name, " ", "-"))
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.formatted_name}-rg"
  location = "West Europe"

  tags = merge(var.default_tags, var.environment_tags)
}

output "rgdemo" {
  value = azurerm_resource_group.rg
}