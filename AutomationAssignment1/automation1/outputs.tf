output "resource_group" {
  value = module.rgroup-n01522692.resource_group.name
}

output "virtual_network_name" {
  value = module.network-n01522692.virtual_network_name
}

output "subnet" {
  value = module.network-n01522692.subnet.name
}

output "log_analytics_workspace_name" {
  value = module.common_services.log_analytics_workspace_name
}

output "recovery_vault_name" {
  value = module.common_services.recovery_vault_name
}

output "storage_account_name" {
  value = module.common_services.storage_account_name
}

output "vm_hostnames" {
  value = module.vmlinux-n01522692.vm_hostnames
}

output "vm_domain_names" {
  value = module.vmlinux-n01522692.vm_domain_names
}

output "vm_private_ip_addresses" {
  value = module.vmlinux-n01522692.vm_private_ip_addresses
}

output "vm_public_ip_addresses" {
  value = module.vmlinux-n01522692.vm_public_ip_addresses
}


output "windows_vm_hostnames" {
  value = module.vmwindows-n01522692.vm_hostname_windows
  
}

output "windows_vm_private_ip" {
  value = module.vmwindows-n01522692.private_ip_addresses_windows
}

output "windows_vm_public_ip" {
  value = module.vmwindows-n01522692.public_ip_addresses_windows
}


output "windows_vm_fqdn" {
  value = module.vmwindows-n01522692.vm_fqdn_windows
}

output "linux_vm_id" {
  value = module.vmlinux-n01522692.vm_ids
}

output "window_vm_id" {
  value = module.vmwindows-n01522692.vm_ids
}

output "loadbalancer_name" {
  value = module.loadbalancer-n01522692.loadbalancer
  
}

output "database_name" {
  value = module.database-n01522692.db_name
  
}