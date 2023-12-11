# Container Registry

resource "azurerm_container_registry" "acr" {
  name                = "azkimototy${var.environment}registry"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Standard"
  admin_enabled       = true
}

# This is to create repository
resource "azurerm_container_registry_webhook" "webhook" {
  name                = var.repo_name
  resource_group_name = var.resource_group_name
  registry_name       = azurerm_container_registry.acr.name
  location            = var.resource_group_location
  service_uri         = var.repo_service_uri
  status              = "enabled"
  actions             = ["push"]
  custom_headers = {
    "Content-Type" = "application/json"
  }
}