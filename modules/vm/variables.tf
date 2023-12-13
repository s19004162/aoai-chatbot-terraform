# -----------------------------------------------------
# VM
# -----------------------------------------------------

# Resource group name
variable "vnet_resource_group_name" {

}

# Resource group location
variable "vnet_resource_group_location" {

}

# VM size
variable "vm_size" {

}

# ip_configuration_name
variable "ip_configuration_name" {

}

# subnet id
variable "subnet_id" {

}

# -----------------------------------------------------
# Private endpoint for aoai
# -----------------------------------------------------

# Resource vnet resource group name
variable "vnet_resource_group_name" {

}

# External variable for location of vnet resource group
variable "vnet_resource_group_location" {

}

# System name prefix
variable "system_name_prefix" {
    description = "Prefix of the System name."
}

# Environment name
variable "environment" {
  default = "prod"
  description = "environment prefix"
}

# subnet id for private endpoint
variable "subnet_id" {

}

# -----------------------------------------------------
# Log Analytics
# -----------------------------------------------------

# Log Analytics Workspace
variable "log_name" {
  
}

# ID of the Log Analytics Workspace
variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace"
  type        = string
}

# Retention days for Log Analytics
variable "log_analytics_retention_days" {
  description = "Retention days for Log Analytics"
  type        = number
}