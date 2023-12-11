# Output the login server and admin credentials
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "Admin username for the container registry"
  sensitive = true
}

output "acr_admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "Admin password for the container registry"
  sensitive = true
}