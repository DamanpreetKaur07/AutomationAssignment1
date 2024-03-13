locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Damanpreet.Kaur"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "rgroup-n01522692" {
  source   = "./modules/rgroup-n01522692"
  rg_name = "N01522692-RG"
  location = "Canada Central" 
  tags = local.tags 
}

module "network-n01522692" {
  source       = "./modules/network"
  location     = module.rgroup-n01522692.resource_group.location
  resource_group_name =  module.rgroup-n01522692.resource_group.name
  virtual_network_name = "N01522692-VNET"
  address_space        = ["10.0.0.0/16"]
  subnet_name         = "N01522692-SUBNET"
  subnet_address_prefixes = ["10.0.0.0/24"]
  nsg_name            = "N01522692-NSG"
  tags = local.tags 

}


module "common_services" {
  source             = "./modules/common-n01522692"
  location     = module.rgroup-n01522692.resource_group.location
  resource_group_name =  module.rgroup-n01522692.resource_group.name
  workspace_name = "N01522692-WORKSPACE"
  recovery_vault_name = "N01522692-RECOVERYVAULT"
  storage_account_name = "n01522692storage"
  tags = local.tags 
}

module "vmlinux-n01522692" {
  source                = "./modules/vmlinux-n01522692"
  location     = module.rgroup-n01522692.resource_group.location
  resource_group_name =  module.rgroup-n01522692.resource_group.name
  subnet_id           = module.network-n01522692.subnet.id
  linux_avs = "N01522692-AVS"
  tags = local.tags 

}


module "vmwindows-n01522692" {
  source              = "./modules/vmwindows-n01522692"
  windows_avs = "windowsAvailabilitySet"
  location     = module.rgroup-n01522692.resource_group.location
  resource_group_name =  module.rgroup-n01522692.resource_group.name
  subnet_id           = module.network-n01522692.subnet.id
  nb_count =  1
  tags = local.tags

}

module "datadisk-n01522692" {
  source              = "./modules/datadisk-n01522692"
  linux_vm_ids        = values(module.vmlinux-n01522692.vm_ids)
  windows_vm_id       = module.vmwindows-n01522692.vm_ids
  resource_group_name =  module.rgroup-n01522692.resource_group.name
  location     = module.rgroup-n01522692.resource_group.location
  linux-vms = module.vmlinux-n01522692.vm_hostnames
  windows-vms = module.vmwindows-n01522692.vm_hostname_windows
  tags = local.tags

}

module "loadbalancer-n01522692" {
  source                = "./modules/loadbalancer-n01522692"
  location              = module.rgroup-n01522692.resource_group.location
  resource_group_name   = module.rgroup-n01522692.resource_group.name
  loadbalancer-name     = "N01522692-LOADBALANCER"
  linux-nic-id          = module.vmlinux-n01522692.nic_ids
  tags                  = local.tags
  linux-vm-name   = module.vmlinux-n01522692.vm_hostnames

  
}
module "database-n01522692" {
  source      = "./modules/database-n01522692"
 location              = module.rgroup-n01522692.resource_group.location
  resource_group_name   = module.rgroup-n01522692.resource_group.name
  db_name = "N01522692-DATABASE"
  tags = local.tags
}