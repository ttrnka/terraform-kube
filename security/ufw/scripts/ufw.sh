#!/bin/sh
set -e

sudo ufw --force reset
sudo ufw allow ssh
sudo ufw allow in on ${private_interface} to any port ${vpn_port} # vpn on private interface
sudo ufw allow in on ${vpn_interface}
sudo ufw allow in on ${kube_overlay_interface} # Kubernetes pod overlay interface
sudo ufw allow 6443 # Kubernetes API secure remote port
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 50000
sudo ufw default deny incoming
sudo ufw --force enable
sudo ufw status verbose