# Output the app service plan id
# output "app_service_plan_id" {
#   value = azurerm_app_service_plan.app_plan.id
# }

# Output the app service plan id
output "app_service_plan_id" {
  value = azurerm_service_plan.app_plan.id
}

# output "app_service_id" {
#   value = azurerm_app_service.app.id
# }

# output "app_service_default_host_name" {
#   value = azurerm_app_service.app.default_site_hostname
# }

output "azurerm_linux_web_app_id" {
  value = azurerm_linux_web_app.app.id
}

output "azurerm_linux_web_app_default_host_name" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "private_endpoint_id" {
  value = azurerm_private_endpoint.appservice_private_endpoint.id
}

# output "url" {
#     value = "${azurerm_app_service.app.name}.azurewebsites.net"
# }

output "url" {
    value = "${azurerm_linux_web_app.app.name}.azurewebsites.net"
}
