# modules/aoai/output.tf

# -----------------------------------------------------
# Azure OpenAI
# -----------------------------------------------------

output "cognitive_account_id" {
  value = azurerm_cognitive_account.openai.id
}

output "cognitive_account_endpoint" {
  value = azurerm_cognitive_account.openai.endpoint
}

output "cognitive_account_primary_access_key" {
  value = azurerm_cognitive_account.openai.primary_access_key
  sensitive = true
}

output "cognitive_account_principal_id" {
  value = azurerm_cognitive_account.openai.identity[0].principal_id
}

output "cognitive_account_tenant_id" {
  value = azurerm_cognitive_account.openai.identity[0].tenant_id
}

output "custom_subdomain_name" {
  value = azurerm_cognitive_account.openai.custom_subdomain_name
}

# -----------------------------------------------------
# deployments
# -----------------------------------------------------

output "cognitive_deployment_cognitive_account_id" {
  value = [
    for deployment in azurerm_cognitive_deployment.deployment: deployment.cognitive_account_id
  ]
}

output "cognitive_deployment_cognitive_id" {
  value = [
    for deployment in azurerm_cognitive_deployment.deployment: deployment.id
  ]
}

# -----------------------------------------------------
# Log Analytics
# -----------------------------------------------------

output "azurerm_monitor_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.settings.id
}

output "azurerm_monitor_diagnostic_setting_log_analytics_destination_type" {
  value = azurerm_monitor_diagnostic_setting.settings.log_analytics_destination_type
}

output "azurerm_monitor_diagnostic_setting_target_resource_id" {
  value = azurerm_monitor_diagnostic_setting.settings.target_resource_id
}