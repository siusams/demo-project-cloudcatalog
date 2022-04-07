# No changes required in the backend block. Use the Jenkins *.properties file to configure the remote state storage account that should be used.
terraform {
  backend "azurerm" {
  }
}