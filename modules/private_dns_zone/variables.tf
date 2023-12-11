# variables.tf

variable "private_dns_name" {
  description = "Name of the private DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "tags" {
  description = "Tags for the private DNS zone"
  type        = map(string)
}

variable "virtual_networks_to_link" {
  description           = "Map of virtual networks to link to the private DNS zone"
  type                  = map(object({
    subscription_id     = string
    resource_group_name = string
  }))
}