resource "azurerm_postgresql_server" "psql_server" {
  name                = "n01522692-server"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.db_username
  administrator_login_password = var.db_pass
  version                      = 9.5
  ssl_enforcement_enabled      = true
  tags                         = var.tags
}

resource "azurerm_postgresql_database" "psql_database" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.psql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}