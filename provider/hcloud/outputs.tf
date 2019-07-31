output "public_ips" {
  value = hcloud_server.host[*].ipv4_address
}

output "private_ips" {
  value = hcloud_server_network.srvethn[*].ip
}

output "hostnames" {
  value = hcloud_server.host[*].name
}

output "private_network_interface" {
  value = "ens10"
}

output "master_nodes" {
  value = flatten([
    for i in hcloud_server.host[*] : {
      name       = i.name
      public_ip  = i.ipv4_address
      private_ip = hcloud_server_network.srvethn[index(hcloud_server.host[*], i)].ip
    }
    if lookup(i.labels, "server_type") == "master"
  ])
}

output "worker_nodes" {
  value = flatten([
    for i in hcloud_server.host[*] : {
      name       = i.name
      public_ip  = i.ipv4_address
      private_ip = hcloud_server_network.srvethn[index(hcloud_server.host[*], i)].ip
    }
    if lookup(i.labels, "server_type") == "worker"
  ])
}