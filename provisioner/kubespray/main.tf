locals {

  masters = [
    for i in var.master_nodes : {
      name         = i.name
      public_ip    = i.public_ip
      private_ip   = i.private_ip
      vpn_ip       = lookup(var.vpn_ips, i.private_ip)
    }
  ]

   workers = [
    for i in var.worker_nodes : {
      name         = i.name
      public_ip    = i.public_ip
      private_ip   = i.private_ip
      vpn_ip       = lookup(var.vpn_ips, i.private_ip)
    }
  ]
  
  inventory = templatefile("${path.module}/templates/hosts.ini", {
    all_nodes    = concat(local.masters, local.workers)
    master_nodes = local.masters
    worker_nodes = local.workers
  })

  cluster_vars = templatefile("${path.module}/templates/k8s-cluster.yaml", {
    kube_service_addresses = var.kube_service_addresses
    kube_pods_subnet       = var.kube_pods_subnet
    kube_network_plugin    = var.kube_network_plugin
  })

  all_vars = templatefile("${path.module}/templates/all.yaml", {
    floating_ip = var.floating_ip
  })

	addons_vars = templatefile("${path.module}/templates/addons.yaml", {

  })
}