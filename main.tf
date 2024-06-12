module "cloudinit" {
  source  = "damoun/cloudinit/coolify"
  version = "1.0.0"
}

resource "hcloud_firewall" "coolify" {
  name = "coolify"

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "8000"
    source_ips = var.firewall_source_ips
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = var.firewall_source_ips
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = var.firewall_source_ips
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "6001"
    source_ips = var.firewall_source_ips
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = var.firewall_source_ips
  }
}

resource "hcloud_server" "coolify" {
  name        = "coolify"
  image       = "ubuntu-24.04"
  server_type = var.server_type
  location    = var.location
  public_net {
    ipv4_enabled = var.ipv4_enabled
    ipv6_enabled = true
  }
  ssh_keys     = var.ssh_keys
  firewall_ids = [hcloud_firewall.coolify.id]
  user_data    = module.cloudinit.user_data
}
