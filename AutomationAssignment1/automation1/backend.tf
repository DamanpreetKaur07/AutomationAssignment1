terraform {
  backend "azurerm" {
    storage_account_name = "tfstaten01522692sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
    access_key           = ""
  }
}
