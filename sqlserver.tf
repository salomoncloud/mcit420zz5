
# Primary SQL Server
resource "azurerm_sql_server" "primary" {
  name                         = "primary-sql-server"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "Password123!"

  tags = {
    environment = "Production"
  }
}

# Secondary SQL Server
resource "azurerm_sql_server" "secondary" {
  name                         = "secondary-sql-server"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West US"  # Secondary region
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "Password123!"
}

# Primary SQL Database
resource "azurerm_sql_database" "primary" {
  name                = "primary-sql-db"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name         = azurerm_sql_server.primary.name
  edition             = "Standard"
  compute_model       = "Serverless"
  auto_pause_delay    = 60
  max_size_gb         = 2
  min_capacity        = 0.1

  tags = {
    environment = "Production"
  }
}

# Secondary SQL Database for Geo-Replication
resource "azurerm_sql_database" "secondary" {
  name                = "secondary-sql-db"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West US"  # Secondary region
  server_name         = azurerm_sql_server.secondary.name
  edition             = "Standard"
  compute_model       = "Serverless"
  auto_pause_delay    = 60
  max_size_gb         = 2
  min_capacity        = 0.1

  tags = {
    environment = "Production"
  }

  # Geo-Replication configuration
  depends_on = [azurerm_sql_database.primary]
  geo_redundant_backup_enabled = true
  create_mode                  = "Secondary"
  secondary_type               = "Geo"
  secondary_zone               = "West US"
  storage_redundancy           = "Geo"
}
