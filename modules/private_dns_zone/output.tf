# modules/private_dns_zone/output.tf

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.private_dns_zone.id
}

# output "virtual_network_links" {
#  value = azurerm_private_dns_zone_virtual_network_link.link[*].id
# }