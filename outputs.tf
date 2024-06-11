output "url" {
  description = "The URL of the Coolify instance"
  value       = "http://${hcloud_server.coolify.ipv4_address}:8000"
}

output "ipv4_address" {
  description = "The IP of the Coolify instance"
  value       = hcloud_server.coolify.ipv4_address
}

output "ipv6_address" {
  description = "The IPv6 of the Coolify instance"
  value       = hcloud_server.coolify.ipv6_address
}
