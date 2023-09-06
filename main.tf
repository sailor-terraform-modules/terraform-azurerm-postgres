
data "azurerm_client_config" "current" {}
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}
resource "azurerm_key_vault" "key_vault" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  logging {
    enabled = true
  }
  
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Backup",
      "Create",
      "Decrypt",
      "Delete",
      "Encrypt",
      "Get",
      "Import",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Sign",
      "UnwrapKey",
      "Update",
      "Verify",
      "WrapKey"
    ]
    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Restore",
      "Recover",
      "Set",
      "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "key_vault_secret" {
  name         = "adminuser"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.key_vault.id
}


resource "azurerm_postgresql_server" "postgresql_server" {
  name                             = var.name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  administrator_login              = var.administrator_login
  administrator_login_password     = random_password.password.result
  sku_name                         = var.sku_name
  version                          = var.postgresql_version
  storage_mb                       = var.storage_mb
  backup_retention_days            = var.backup_retention_days
  geo_redundant_backup_enabled     = var.geo_redundant_backup_enabled
  public_network_access_enabled    = var.public_network_access_enabled
  ssl_enforcement_enabled          = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced
}
