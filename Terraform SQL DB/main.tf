terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm ={
      source = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "examplerg" {
  name = "syedjavedrg"
  location = "canada central"
}

resource "azurerm_mssql_server" "sql-server" {
  name = "syed-my-sql-server"
  resource_group_name = azurerm_resource_group.examplerg.name
  location = azurerm_resource_group.examplerg.location
  version = "12.0"
  administrator_login = "sqladmin"
  administrator_login_password = "*******"
}

resource "azurerm_mssql_database" "sampledb" {
  name = "sampledb1"
  server_id = azurerm_mssql_server.sql-server.id
}

resource "azurerm_mssql_firewall_rule" "firewall-rule" {
  name = "syed-mssql-firewall-rule"
  server_id = azurerm_mssql_server.sql-server.id
  start_ip_address = "clientip"
  end_ip_address = "clientip"
}