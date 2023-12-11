# Resource group name
variable "resource_group_name" {

}

# Resource group location
variable "resource_group_location" {

}

# Resource vnet resource group name
variable "vnet_resource_group_name" {

}

# External variable for location of vnet resource group
variable "vnet_resource_group_location" {

}

# Environment name
variable "environment" {
  description = "environment prefix"
}

# Vnet name
variable "vnet_name" {
    description = "vnet name"
}

# vnet_address_space
variable "vnet_address_space" {

}

# bastion subnet name
variable "bstsubnet_name" {

}

# bastion_address_space
variable "bstsubnet_address_space" {
  
}

# virtual machine subnet name
variable "vmsubnet_name" {

}

# vmsubnet_address_space
variable "vmsubnet_address_space" {
  
}

# private endpoint subnet name
variable "pesubnet_name" {

}

# pesubnet_address_space
variable "pesubnet_address_space" {
  
}

# appservice backend subnet name
variable "apbksubnet_name" {

}

# pesubnet_address_space
variable "apbksubnet_address_space" {
  
}
