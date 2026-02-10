<h1 align="center">
  terraform-hetzner-coolify
  <br>
</h1>

<h4 align="center">A terraform module to deploy Coolify on Hetzner Cloud.</h4>

<p align="center">
  <a href="#requirements">Requirements</a> •
  <a href="#example">Example</a> •
  <a href="#providers">Providers</a> •
  <a href="#modules">Modules</a> •
  <a href="#inputs">Inputs</a> •
  <a href="#Outputs">Outputs</a> •
  <a href="#resources">Resources</a>
</p>

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |

## Example

```hcl
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
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudinit"></a> [cloudinit](#module\_cloudinit) | registry.terraform.io/damoun/cloudinit/coolify | 1.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_source_ips"></a> [firewall\_source\_ips](#input\_firewall\_source\_ips) | Source networks that have access to Coolify. | `list(string)` | <pre>[<br>  "0.0.0.0/0",<br>  "::/0"<br>]</pre> | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Whether the Coolify instance should have a public IPv4 address. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the Coolify instance should be created. | `string` | n/a | yes |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | The server type to use for the Coolify instance. | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | The SSH key IDs to use for the Coolify instance. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The IP of the Coolify instance |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | The IPv6 of the Coolify instance |
| <a name="output_url"></a> [url](#output\_url) | The URL of the Coolify instance |

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.coolify](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_server.coolify](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
<!-- END_TF_DOCS -->