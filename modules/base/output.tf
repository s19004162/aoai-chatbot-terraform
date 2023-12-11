# -----------------------------------------------------
# Resource group
# -----------------------------------------------------
output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
    value = azurerm_resource_group.rg.id
}

output "resource_group_location" {
    value = azurerm_resource_group.rg.location
}

# -----------------------------------------------------
# Vnet Resource group
# -----------------------------------------------------

output "vnet_resource_group_name" {
    value = azurerm_resource_group.vnet-rg.name
}

output "vnet_resource_group_id" {
    value = azurerm_resource_group.vnet-rg.id
}

output "vnet_resource_group_location" {
    value = azurerm_resource_group.vnet-rg.location
}