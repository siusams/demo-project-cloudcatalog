provider "azurerm" {
  features {}
}

module "recommended_provider_versions" {
  source = "../../templates/modules/common/required_providers"
}

module "environment_variables" {
  source           = "../../templates/modules/common/environment_variables"
  environment      = var.environment
  cost_center      = var.cost_center
  application_name = var.application_name
}

module "resource_group" {
  source   = "../../templates/modules/common/resource_group"
  name     = var.state_file_resource_group_name
  location = var.state_file_resource_group_location
}

module "storage_account" {
  source                   = "../../templates/modules/storage/storage_account"
  name                     = var.state_file_storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  environment_variables    = module.environment_variables.values

  containers = [
    {
      name = "tfstate"
    }
  ]

  network_rules = {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    virtual_network_subnet_ids = [
      "/subscriptions/a0751a92-0d4b-4340-8bc6-086ed5c6dce4/resourceGroups/CAC-DevOpsPlat-Production-network/providers/Microsoft.Network/virtualNetworks/VNET-CAC-DevOpsPlat-Production-01/subnets/Application",
      "/subscriptions/957108b5-005f-4b11-bae1-9e62ba39e857/resourceGroups/VNET_MFCv2-Internal-CAC-Production-S5-PCF/providers/Microsoft.Network/virtualNetworks/MFCv2-Internal-CAC-Production-S5-PCF/subnets/BYOComponent"
    ]
  }
}