# -----------------------------------------------------
# App insights
# -----------------------------------------------------

resource "azurerm_application_insights" "app_insights" {
  name                                    = var.app_insights_name
  resource_group_name                     = var.resource_group_name
  location                                = var.resource_group_location
  application_type                        = "web"
}

resource "azurerm_application_insights_api_key" "app_insights_key" {
  name                                    = var.app_insights_key_name
  application_insights_id                 = azurerm_application_insights.app_insights.id
  read_permissions                        = ["aggregate", "api", "draft", "extendqueries", "search"]
}
