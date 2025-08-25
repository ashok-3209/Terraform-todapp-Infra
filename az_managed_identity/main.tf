resource "azurerm_user_assigned_identity" "user_identity" {
  location            = var.rg_name
  name                = var.user_identity
  resource_group_name = var.rg_location
  tags = var.tags
}

