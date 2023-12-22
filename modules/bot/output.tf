# -----------------------------------------------------
# Bot
# -----------------------------------------------------

output "bot_service_id" {
  value = azurerm_bot_service_azure_bot.bot.id
}

output "bot_service_endpoint" {
  value = azurerm_bot_service_azure_bot.bot.endpoint
}