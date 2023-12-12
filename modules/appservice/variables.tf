# -----------------------------------------------------
# App service plan, App service
# -----------------------------------------------------

# Resource group name
variable "resource_group_name" {

}

# Resource group location
variable "resource_group_location" {

}

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

# tags
variable "tags" {
  description = "Tags for the Azure App Service"
  type        = map(string)
  default     = {}
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

# -----------------------------------------------------
# Private endpoint for app service
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