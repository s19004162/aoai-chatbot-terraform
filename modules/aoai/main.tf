# -----------------------------------------------------
# Azure OpenAI
# -----------------------------------------------------

resource "azurerm_cognitive_account" "openai" {
  name                          = var.aoai_name
  location                      = var.aoai_location
  resource_group_name           = var.resource_group_name
  kind                          = "OpenAI"
  custom_subdomain_name         = var.custom_subdomain_name
  sku_name                      = var.aoai_sku_name
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_cognitive_deployment" "deployment" {
  for_each             = {for deployment in var.aoai_deployments: deployment.name => deployment}

  name                 = each.key
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = each.value.model.name
    version = each.value.model.version
  }

  scale {
    type = "Standard"
  }
}

# -----------------------------------------------------
# Private DNS zone for aoai
# -----------------------------------------------------

# Create Private DNS Zone for OpenAI
resource "azurerm_private_dns_zone" "openai_dns_zone" {
  name                = "privatelink.openai.azure.com"
  resource_group_name = var.vnet_resource_group_name
}

# -----------------------------------------------------
# Private endpoint for aoai
# -----------------------------------------------------

# Private endpoint for openai
resource "azurerm_private_endpoint" "openai_private_endpoint" {
  name                           = "${var.system_name_prefix}-${var.environment}-openai-pe"
  location                       = var.vnet_resource_group_location
  resource_group_name            = var.vnet_resource_group_name
  subnet_id                      = var.subnet_id

  private_service_connection {
    name                           = "${var.system_name_prefix}-${var.environment}-openai-psc"
    private_connection_resource_id = azurerm_cognitive_account.openai.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }

}

# -----------------------------------------------------
# DNS record 
# -----------------------------------------------------

resource "azurerm_private_dns_a_record" "openai_dns_record" {
  name                = var.aoai_name
  zone_name           = "privatelink.openai.azure.com"
  resource_group_name = var.vnet_resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.openai_private_endpoint.private_service_connection[0].private_ip_address]
}

# -----------------------------------------------------
# Log Analytics
# -----------------------------------------------------

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.log_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "settings" {
  name                       = "DiagnosticsSettings"
  target_resource_id         = azurerm_cognitive_account.openai.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "Audit"

    retention_policy {
      enabled = true
      days    = var.log_analytics_retention_days
    }
  }

  enabled_log {
    category = "RequestResponse"

    retention_policy {
      enabled = true
      days    = var.log_analytics_retention_days
    }
  }

  enabled_log {
    category = "Trace"

    retention_policy {
      enabled = true
      days    = var.log_analytics_retention_days
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = var.log_analytics_retention_days
    }
  }
}