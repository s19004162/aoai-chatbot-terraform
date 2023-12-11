# Output the bastion subnet_id
output "bst_subnet_id" {
  value = azurerm_subnet.bst_subnet.id
}

# Output the bastion vmsubnet_id
output "vm_subnet_id" {
  value = azurerm_subnet.vm_subnet.id
}

# Output the pe subnet_id
output "pe_subnet_id" {
  value = azurerm_subnet.pe_subnet.id
}

# Output the app service backend subnet_id
output "apbk_subnet_id" {
  value = azurerm_subnet.apbk_subnet.id
}
