# -----------------------------------------------------
# Variables for base
# -----------------------------------------------------

# System name prefix
variable "system_name_prefix" {
  default     = "AZ-kimototy"
  description = "prefix of the System name."
}

variable "environment" {
  default     = "prod"
  description = "environment prefix"
}

# External variable for location of resource group
variable "resource_group_location" {
  default = "West Europe"

}

# Resource group name
variable "resource_group_name" {

}

# Tags 
variable "tags" {
  description = "Tags for the Cognitive Account"
  type        = map(string)
}

# -----------------------------------------------------
# Variables for registry
# -----------------------------------------------------

# External variable for Repository name
variable "repo_name" {

}

# External variable for Repository service uri
variable "repo_service_uri" {

}

# -----------------------------------------------------
# Variables for Azure OpenAI
# -----------------------------------------------------

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

# List of Cognitive Deployments
variable "aoai_deployments" {
  description = "List of Cognitive Deployments"
  type        = list(object({
    name  = string
    model = map(string)
  }))
}

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

# -----------------------------------------------------
# Variables for Network
# -----------------------------------------------------

# External variable for location of vnet resource group
variable "vnet_resource_group_location" {

}

# Resource vnet resource group name
variable "vnet_resource_group_name" {

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


# -----------------------------------------------------
# Variables for Private DNS Zone
# -----------------------------------------------------

variable "private_dns_name" {
  description = "Name of the private DNS zone"
  type        = string
}

variable "virtual_networks_to_link" {
  description = "Map of virtual networks to link to the private DNS zone"
  type        = map(object({
    subscription_id    = string
    resource_group_name = string
  }))
}

# -----------------------------------------------------
# App service plan, App service
# -----------------------------------------------------

# app_service_plan_name
variable "app_service_plan_name" {

}

# app_service_plan_size
variable "app_service_plan_size" {

}

# app_service_plan_tier
variable "app_service_plan_tier" {

}

# os_type
variable "os_type" {

}

# app_service_name
variable "app_service_name" {

}

# app_settings
variable "app_settings" {
  description = "App settings for the App Service"
  type        = list(object({
    key   = string
    value = string
  }))
  default     = []
}

