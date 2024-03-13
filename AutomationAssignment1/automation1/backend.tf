terraform {
  backend "azurerm" {
    storage_account_name = "tfstaten01522692sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
    access_key           = "IuUPVkyyWT8/8scX/aw5r1M4F2G+SXbBKPjIgr/ZFDb/fpaP1bhv4YgS1qmdct7xD2RjAS2pq50H+AStPRXixg=="
  }
}
