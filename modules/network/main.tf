# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                     = var.vnet_name
  resource_group_name      = var.vnet_resource_group_name
  address_space            = var.vnet_address_space
  location                 = var.vnet_resource_group_location
}

# Create a bastion subnet
resource "azurerm_subnet" "bst_subnet" {
  name                      = var.bstsubnet_name
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = var.vnet_name
  address_prefixes          = var.bstsubnet_address_space
}

# Create a virtual machine subnet
resource "azurerm_subnet" "vm_subnet" {
  name                      = var.vmsubnet_name
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = var.vnet_name
  address_prefixes          = var.vmsubnet_address_space
}

# Create a private endpoint subnet
resource "azurerm_subnet" "pe_subnet" {
  name                      = var.pesubnet_name
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = var.vnet_name
  address_prefixes          = var.pesubnet_address_space
}

# Create a app service backend subnet
resource "azurerm_subnet" "apbk_subnet" {
  name                      = var.apbksubnet_name
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = var.vnet_name
  address_prefixes          = var.apbksubnet_address_space
}
