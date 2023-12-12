# App service Plan
resource "azurerm_app_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  # sku_name            = var.sku_name
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }

  # os_type = var.os_type

  tags = var.tags

}

# App service
resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

#  dynamic "app_settings" {
#    for_each = var.app_settings
#    content {
#      name    = app_setting.key
#      value   = app_setting.value
#    }
#  }
  
  tags = var.tags
}

# -----------------------------------------------------
# Private DNS zone for appservice
# -----------------------------------------------------

# Create Private DNS Zone for appservice
resource "azurerm_private_dns_zone" "appservice_dns_zone" {
  name                = "privatelink.azurewebsites.azure.com"
  resource_group_name = var.vnet_resource_group_name
}

# -----------------------------------------------------
# Private endpoint for appservice
# -----------------------------------------------------

# Private endpoint for app service
resource "azurerm_private_endpoint" "appservice_private_endpoint" {
  name                           = "${var.system_name_prefix}-${var.environment}-appservice-pe"
  location                       = var.vnet_resource_group_location
  resource_group_name            = var.vnet_resource_group_name
  subnet_id                      = var.subnet_id

  private_service_connection {
    name                           = "${var.system_name_prefix}-${var.environment}-appservice-psc"
    private_connection_resource_id = azurerm_app_service.app.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags                             = var.tags

}
