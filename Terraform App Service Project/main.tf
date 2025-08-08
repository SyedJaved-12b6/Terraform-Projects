# Define a variable for the GitHub token
variable "github_token" {
  type        = string
  description = "GitHub Personal Access Token for source control"
  sensitive   = true # Mark as sensitive to prevent output
}

variable "prefix" {
    default = "nasiya"
    type = string  
}

resource "azurerm_resource_group" "rg" {
  name = "${var.prefix}-rg"
  location = "canadacentral"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "${var.prefix}-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "as" {
  name                = "${var.prefix}-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
}

resource "azurerm_app_service_slot" "slot" {
  name                = "${var.prefix}-staging"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  app_service_name    = azurerm_app_service.as.name
}

# Add this resource to establish the connection
resource "azurerm_source_control_token" "github_token" {
  type = "GitHub"
  token = var.github_token
}

resource "azurerm_app_service_source_control" "scm" {
  app_id                    = azurerm_app_service.as.id
  repo_url                  = "https://github.com/SyedJaved-12b6/appservice-terraform"
  branch                    = "master"
  use_manual_integration    = false
  use_mercurial            = false
  rollback_enabled         = false
}

resource "azurerm_app_service_source_control_slot" "scm1" {
  slot_id                   = azurerm_app_service_slot.slot.id
  repo_url                  = "https://github.com/SyedJaved-12b6/appservice-terraform"
  branch                    = "appServiceSlot_Working_DO_NOT_MERGE"
  use_manual_integration    = false
  use_mercurial            = false
  rollback_enabled         = false
}

resource "azurerm_web_app_active_slot" "active" {
  slot_id = azurerm_app_service_slot.slot.id

}