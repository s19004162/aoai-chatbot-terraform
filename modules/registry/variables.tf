# System name prefix
variable "system_name_prefix" {
    description = "Prefix of the System name."
}

# Environment name
variable "environment" {
  default = "prod"
  description = "environment prefix"
}

# Resource group location
variable "resource_group_location" {
  default = "West Europe"

}

# Resource group name
variable "resource_group_name" {

}

# Repository name
variable "repo_name" {

}

# Repository service uri
variable "repo_service_uri" {

}