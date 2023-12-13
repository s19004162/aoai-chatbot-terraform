# -----------------------------------------------------
# VM
# -----------------------------------------------------

output "vm_id" {
  value = azurerm_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_virtual_machine.vm.name
}

output "vm_private_ip" {
  value = azurerm_virtual_machine.vm.network_interface_ids[0].private_ip_address
}

