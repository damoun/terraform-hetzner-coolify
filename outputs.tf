output "url" {
  description = "The URL of the Coolify instance"
  value       = "http://${hcloud_server.coolify.ipv4_address}:8000"
}
