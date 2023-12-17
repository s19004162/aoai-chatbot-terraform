# -----------------------------------------------------
# Public ip for bastion host
# -----------------------------------------------------

output "public_ip_id" {
  value = azurerm_public_ip.bst_pip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.bst_pip.ip_address
}

# -----------------------------------------------------
# bastion
# -----------------------------------------------------

output "bastion_id" {
  value = azurerm_bastion_host.bst_host.id
}

output "bastion_fqdn" {
  value = azurerm_bastion_host.bst_host.dns_name
}