variable "environment" {
  description = "The environment being provisioned ie. dev, test, uat or prod"
  type        = string
}

variable "cost_center" {
  description = "The cost center code ie. 0000"
  type        = string
}

variable "application_name" {
  description = "The name of the application."
  type        = string
}

variable "state_file_resource_group_name" {
  description = "The name of the resource group in which to deploy the backend/statefile storage account."
  type        = string
}

variable "state_file_resource_group_location" {
  description = "The Azure region in which to provision the infrastructure."
  type        = string
}

variable "state_file_storage_account_name" {
  description = "The name of the storage account in which to store the backend/statefiles."
  type        = string
}