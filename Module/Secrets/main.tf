resource "azurerm_key_vault_secret" "secrests" {
  name         = var.secret_name
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.angel_kv.id
}

