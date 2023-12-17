# -----------------------------------------------------
# Bastion
# -----------------------------------------------------

# Public IP address
resource "azurerm_public_ip" "bst_pip" {
  name                            = var.bst_pip_name
  location                        = var.vnet_resource_group_location
  resource_group_name             = var.vnet_resource_group_name
  allocation_method               = "Static"
  sku                             = "Standard"
}

# Bastion host
resource "azurerm_bastion_host" "bst_host" {
  name                            = var.bst_name
  location                        = var.vnet_resource_group_location
  resource_group_name             = var.vnet_resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.bst_pip.id
  }
}