# -----------------------------------------------------
# Bot
# -----------------------------------------------------

# resource "random_uuid" "uuid" {
# }

# Bot Service
resource "azurerm_bot_service_azure_bot" "bot" {
  name                                    = var.bot_name
  resource_group_name                     = var.resource_group_name
  location                                = var.resource_group_location
  microsoft_app_id                        = var.microsoft_app_id
  sku                                     = var.bot_sku

  endpoint                                = var.app_endpoint
  developer_app_insights_api_key          = var.developer_app_insights_api_key
  developer_app_insights_application_id   = var.developer_app_insights_application_id
  tags                                    = var.tags
}

# -----------------------------------------------------
# Private DNS zone for bot
# -----------------------------------------------------

# Create Private DNS Zone for bot service
resource "azurerm_private_dns_zone" "bot_dns_zone" {
  name                = "privatelink.directline.botframework.com"
  resource_group_name = var.vnet_resource_group_name
}

# -----------------------------------------------------
# Private endpoint for bot
# -----------------------------------------------------

# Private endpoint for bot
resource "azurerm_private_endpoint" "bot_private_endpoint" {
  name                           = "${var.system_name_prefix}-${var.environment}-bot-pe"
  location                       = var.vnet_resource_group_location
  resource_group_name            = var.vnet_resource_group_name
  subnet_id                      = var.subnet_id

  private_service_connection {
    name                           = "${var.system_name_prefix}-${var.environment}-bot-psc"
    private_connection_resource_id = azurerm_bot_service_azure_bot.bot.id
    subresource_names              = ["bot"]
    is_manual_connection           = false
  }

}

# -----------------------------------------------------
# DNS record 
# -----------------------------------------------------

resource "azurerm_private_dns_a_record" "bot_dns_record" {
  name                = "bot-service"
  zone_name           = "privatelink.directline.botframework.com"
  resource_group_name = var.vnet_resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.bot_private_endpoint.private_service_connection[0].private_ip_address]
}