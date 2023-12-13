# -----------------------------------------------------
# VM NIC
# -----------------------------------------------------

# System name prefix
variable "system_name_prefix" {
    description = "Prefix of the System name."
}

# Environment name
variable "environment" {
  description = "environment prefix"
}

# VNET Resource group name
variable "vnet_resource_group_name" {

}

# VNET Resource group location
variable "vnet_resource_group_location" {

}

# ip_configuration_name
variable "ip_configuration_name" {

}

# subnet id
variable "subnet_id" {

}

# -----------------------------------------------------
# VM
# -----------------------------------------------------

# VM size
variable "vm_size" {

}

# admin_username
variable "admin_username" {

}

# admin_password
variable "admin_password" {

}
