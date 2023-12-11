# -----------------------------------------------------
# Azure OpenAI
# -----------------------------------------------------

# Resource group name
variable "resource_group_name" {

}

# Resource group location
variable "resource_group_location" {
  default = "West Europe"

}

# Name of the Azure Cognitive Account
variable "aoai_name" {
  description = "Name of the Azure Cognitive Account"
  type        = string
}

# Location for resources
variable "aoai_location" {
  description = "Location for resources"
  type        = string
}

# Custom subdomain name for the Cognitive Account
variable "custom_subdomain_name" {
  description = "Custom subdomain name for the Cognitive Account"
  type        = string
}

# SKU name for the Cognitive Account
variable "aoai_sku_name" {
  description = "SKU name for the Cognitive Account"
  type        = string
}

# Enable public network access for the Cognitive Account
variable "public_network_access_enabled" {
  description = "Enable public network access for the Cognitive Account"
  type        = bool
}

# Tags for the Cognitive Account
variable "tags" {
  description = "Tags for the Cognitive Account"
  type        = map(string)
}

# List of Cognitive Deployments
variable "aoai_deployments" {
  description = "List of Cognitive Deployments"
  type        = list(object({
    name  = string
    model = map(string)
  }))
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