# App service Plan
# resource "azurerm_app_service_plan" "app_plan" {
#   name                = var.app_service_plan_name
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name

  # sku {
  #   tier = var.app_service_plan_tier
  #   size = var.app_service_plan_size
  # }
#   tags = var.tags
# }

# App service Plan
resource "azurerm_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  # sku {
  #   tier = var.app_service_plan_tier
  #   size = var.app_service_plan_size
  # }

  os_type             = "Linux"
  sku_name            = "P1v2"

  tags = var.tags

}

# App service
resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  # service_plan_id     = azurerm_app_service_plan.app_plan.id
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    application_stack {
      docker_image_name         = "chatapp:latest"
      docker_registry_url       = "https://azkimototytestregistry.azurecr.io"
      docker_registry_username  = "azkimototytestregistry"
      docker_registry_password  = "H8llOf6QOJpcMnG33PYI3K9bTE/Go2OviePMHqRlHV+ACRDo3z84"
    }
  }
}

# App service
# resource "azurerm_app_service" "app" {
#   name                = var.app_service_name
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   app_service_plan_id = azurerm_app_service_plan.app_plan.id
# 
#  dynamic "app_settings" {
#    for_each = var.app_settings
#    content {
#      name    = app_setting.key
#      value   = app_setting.value
#    }
#  }
#   
#   tags = var.tags
# }

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
    # private_connection_resource_id = azurerm_app_service.app.id
    private_connection_resource_id = azurerm_linux_web_app.app.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags                             = var.tags

}
