# -----------------------------------------------------
# Bot
# -----------------------------------------------------

# bot_name
variable "bot_name" {

}

# Resource group name
variable "resource_group_name" {

}

# Resource group location
variable "resource_group_location" {

}

# microsoft_app_id
variable "microsoft_app_id" {

}

# bot_sku
variable "bot_sku" {

}

# app_endpoint
variable "app_endpoint" {

}

# developer_app_insights_api_key
variable "developer_app_insights_api_key" {

}

# developer_app_insights_application_id
variable "developer_app_insights_application_id" {

}

# tags
variable "tags" {
  description = "Tags for the Cognitive Account"
  type        = map(string)
}

# -----------------------------------------------------
# Private DNS zone for bot
# -----------------------------------------------------

variable "vnet_resource_group_name" {

}

# -----------------------------------------------------
# Private endpoint for bot
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

variable "vnet_resource_group_location" {

}

variable "subnet_id" {

}