# -----------------------------------------------------
# Base
# -----------------------------------------------------

module "base" {
  source                        = "./modules/base"
  system_name_prefix            = var.system_name_prefix
  resource_group_name           = var.resource_group_name  
  resource_group_location       = var.resource_group_location
  environment                   = var.environment

  # Vnet resource group
  vnet_resource_group_name      = var.vnet_resource_group_name  
  vnet_resource_group_location  = var.vnet_resource_group_location
}

# -----------------------------------------------------
# Network
# -----------------------------------------------------

module "network" {
  source = "./modules/network"

  vnet_name                       = var.vnet_name
  environment                     = var.environment
  resource_group_name             = module.base.resource_group_name
  resource_group_location         = module.base.resource_group_location
  vnet_resource_group_name        = module.base.vnet_resource_group_name
  vnet_resource_group_location    = module.base.vnet_resource_group_location
  vnet_address_space              = var.vnet_address_space

  # bastion subnet
  bstsubnet_name                    = var.bstsubnet_name
  bstsubnet_address_space           = var.bstsubnet_address_space

  # virtual machine subnet
  vmsubnet_name                     = var.vmsubnet_name
  vmsubnet_address_space            = var.vmsubnet_address_space

  # Private endpoint
  pesubnet_name                     = var.pesubnet_name
  pesubnet_address_space            = var.pesubnet_address_space

  # App service plan backend
  apbksubnet_name                   = var.apbksubnet_name
  apbksubnet_address_space          = var.apbksubnet_address_space

}

# -----------------------------------------------------
# Private Dns Zone
# -----------------------------------------------------

#module "private_dns_zone" {
#  source = "./modules/private_dns_zone"
#
#  private_dns_name          = var.private_dns_name
#  resource_group_name       = var.resource_group_name
#  tags                      = var.tags
#  virtual_networks_to_link  = var.virtual_networks_to_link
#}

# -----------------------------------------------------
# Container Registry
# -----------------------------------------------------
# Hand over resource group name from base module

module "registry" {
  source                  = "./modules/registry"
  system_name_prefix      = var.system_name_prefix
  resource_group_name     = module.base.resource_group_name
  resource_group_location = module.base.resource_group_location
  environment             = var.environment
  repo_name               = var.repo_name
  repo_service_uri        = var.repo_service_uri
}

# -----------------------------------------------------
# Azure OpenAI
# -----------------------------------------------------

module "cognitive_account" {
  source = "./modules/aoai"

  # Pass variables to the module
  aoai_name                     = var.aoai_name
  aoai_location                 = var.aoai_location
  resource_group_name           = module.base.resource_group_name
  resource_group_location       = module.base.resource_group_location
  custom_subdomain_name         = var.custom_subdomain_name
  aoai_sku_name                 = var.aoai_sku_name
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  aoai_deployments              = var.aoai_deployments
  log_name                      = var.log_name  
  log_analytics_workspace_id    = var.log_analytics_workspace_id
  log_analytics_retention_days  = var.log_analytics_retention_days

  # Private endpoint
  vnet_resource_group_name      = module.base.vnet_resource_group_name
  vnet_resource_group_location  = module.base.vnet_resource_group_location
  subnet_id                     = module.network.pe_subnet_id
  system_name_prefix            = var.system_name_prefix
  environment                   = var.environment
}

