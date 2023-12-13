# -----------------------------------------------------
# VM
# -----------------------------------------------------

resource "azurerm_network_interface" "vm_nic" {
  name                            = "${var.system_name_prefix}-${var.environment}-vm-nic"
  location                        = var.vnet_resource_group_location
  resource_group_name             = var.vnet_resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                      = "${var.system_name_prefix}-${var.environment}-vm"
  resource_group_name       = var.vnet_resource_group_name
  location                  = var.vnet_resource_group_location
  size                      = var.vm_size
  admin_username            = var.admin_username
  admin_password            = var.admin_password
  network_interface_ids     = [azurerm_network_interface.vm_nic.id]
  
  enable_automatic_updates  = false
  patch_mode                = "Manual"
  provision_vm_agent        = true

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  os_disk {
    caching                = "ReadWrite"
    storage_account_type   = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter-gensecond"
    version   = "latest"
  }

  tags = var.tags

}
