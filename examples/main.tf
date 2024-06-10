# Example, should give the user an idea about how to use this module.
# This code is found in the examples directory.
terraform {
  required_version = ">= 1.8.4"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.47.0"
    }
  }
}

provider "hcloud" {}

resource "hcloud_ssh_key" "root" {
  name       = "root"
  public_key = file("~/.ssh/id_ed25519.pub")
}

module "coolify" {
  source = "../"

  providers = {
    hcloud = hcloud
  }

  server_type = "cax11"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.root.id]
}

output "url" {
  value = module.coolify.url
}
