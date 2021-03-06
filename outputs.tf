output "ssh_private_key" {
  value = module.provider.ssh_private_key
}

output "admin_user" {
  value = module.provider.admin_user
}

output "master_nodes" {
  value = module.provider.master_nodes
}

output "worker_nodes" {
  value = module.provider.worker_nodes
}

output "kubespray_inventory" {
  value = module.provisioner.inventory
}

output "kubespray_cluster_vars" {
  value = module.provisioner.cluster_vars
}

output "kubespray_addons_vars" {
  value = module.provisioner.addons_vars
}