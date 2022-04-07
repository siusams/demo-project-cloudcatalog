# No changes required in the backend block. Use the Jenkins backend-*-deploy.properties file to configure the remote state storage account.
terraform {
  backend "azurerm" {
  }
}