# -----------------------------------------------------
# Resource group
# -----------------------------------------------------

# System name prefix
variable "system_name_prefix" {
    description = "Prefix of the System name."
}

# Environment name
variable "environment" {
  default = "prod"
  description = "environment prefix"
}

# Resource group name
variable "resource_group_name" {

}

# Resource group location
variable "resource_group_location" {

}

# -----------------------------------------------------
# Vnet Resource group
# -----------------------------------------------------

# Vnet Resource group name
variable "vnet_resource_group_name" {

}

# Vnet Resource group location
variable "vnet_resource_group_location" {

}