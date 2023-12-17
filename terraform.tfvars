# -----------------------------------------------------
# Variables for base
# -----------------------------------------------------

# resource group
system_name_prefix      = "AZ-kimototy"
environment             = "test"
resource_group_name     = "AZ-kimototy-test-rg"
resource_group_location = "West Europe"

# Vnet resource group
vnet_resource_group_name        = "AZ-kimototy-hub"
vnet_resource_group_location    = "West Europe"

# -----------------------------------------------------
# Variables for Network
# -----------------------------------------------------

# Vnet
vnet_name                         = "AZ-kimototy-vnet"
vnet_address_space                = ["10.250.0.0/16"]

# bastion subnet
bstsubnet_name                    = "AzureBastionSubnet"
bstsubnet_address_space           = ["10.250.0.0/24"]

# virtual machine subnet
vmsubnet_name                     = "AZ-kimototy-vm-subnet"
vmsubnet_address_space            = ["10.250.1.0/24"]

# private endpoint subnet
pesubnet_name                     = "AZ-kimototy-pe-subnet"
pesubnet_address_space            = ["10.250.2.0/24"]

# appservice backend subnet
apbksubnet_name                   = "AZ-kimototy-appback-subnet"
apbksubnet_address_space          = ["10.250.3.0/24"]

# -----------------------------------------------------
# Variables for registry
# -----------------------------------------------------
repo_name               = "chatapi"
repo_service_uri        = "https://azkimototyacr/chatapi"

# -----------------------------------------------------
# Variables for Azure OpenAI
# -----------------------------------------------------
aoai_name                     = "az-kimototy-aoai"
aoai_location                 = "UK South"
custom_subdomain_name         = "az-kimototy-aoai"
aoai_sku_name                 = "S0"
public_network_access_enabled = true
tags                          = { environment = "test", project = "az-kimototy" }

aoai_deployments = [
  {
    name  = "AZ-kimototy-gpt4"
    model = { name = "gpt-4", version = "1106-Preview" }
  },
  {
    name  = "AZ-kimototy-gpt-35-turbo"
    model = { name = "gpt-35-turbo", version = "0301" }
  }
]

log_name                       = "AZ-kimototy-log"
log_analytics_workspace_id     = "/subscriptions/036a79cf-e267-44dc-9234-c338c05a54d1/resourceGroups/AZ-kimototy-test-rg/providers/Microsoft.OperationalInsights/workspaces/AZ-kimototy-log"
log_analytics_retention_days   = 0

# -----------------------------------------------------
# Variables for private dns zone
# -----------------------------------------------------

private_dns_name    = "AZ-kimototy.aoai"

virtual_networks_to_link = {
  "AZ-kimototy-vnet-1" = {
    subscription_id     = "036a79cf-e267-44dc-9234-c338c05a54d1"
    resource_group_name = "AZ-kimototy-test-rg"
  },
  "AZ-kimototy-vnet-2" = {
    subscription_id     = "036a79cf-e267-44dc-9234-c338c05a54d1"
    resource_group_name = "AZ-kimototy-test-rg"
  },
  # Add more virtual networks as needed
}

# -----------------------------------------------------
# Variables for App service
# -----------------------------------------------------

app_service_plan_name   = "AZ-kimototy-test-appserviceplan"
app_service_plan_tier   = "Basic"
app_service_plan_size   = "B1"
os_type                 = "Linux"
app_service_name        = "AZ-kimototy-test-aoai-appservice"
app_settings            = [
  {
    key   = "MicrosoftAppId"
    value = "ab061ea9-2560-4d2f-9765-06638e856b83"
  },
  {
    key   = "MicrosoftAppPassword"
    value = ""
  }
  # Add more key-value pairs as needed
]

# -----------------------------------------------------
# VM NIC
# -----------------------------------------------------

ip_configuration_name   = "internal"
vm_size                 = "Standard_D2s_v3"
admin_username          = "tkuser01"
admin_password          = "#Katsushikaho931"

# -----------------------------------------------------
# Bastion
# -----------------------------------------------------

bst_pip_name            = "AZ-kimototy-bst-pip"
bst_name                = "AZ-kimototy-bst"