# -----------------------------------------------------
# Resource group
# -----------------------------------------------------

resource "azurerm_resource_group" "rg" {
  name     = "${var.system_name_prefix}-${var.environment}-rg"
  location = var.resource_group_location
  tags = {
    system = var.system_name_prefix
    env = var.environment
  }
}

# -----------------------------------------------------
# Vnet Resource group
# -----------------------------------------------------

resource "azurerm_resource_group" "vnet-rg" {
  name     = var.vnet_resource_group_name
  location = var.vnet_resource_group_location
  tags = {
    system = var.system_name_prefix
    env = var.environment
  }
}