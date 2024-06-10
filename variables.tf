variable "location" {
  description = "The location where the Coolify instance should be created."
  type        = string

  validation {
    condition     = contains(["fsn1", "nbg1", "hel1", "ash", "hil"], var.location)
    error_message = "Location must be \"fsn1\", \"nbg1\", \"hel1\", \"ash\" or \"hil\"."
  }
}

variable "server_type" {
  description = "The server type to use for the Coolify instance."
  type        = string

}

variable "ssh_keys" {
  description = "The SSH key IDs to use for the Coolify instance."
  type        = list(string)
}

variable "ipv4_enabled" {
  description = "Whether the Coolify instance should have a public IPv4 address."
  type        = bool
  default     = true
}

variable "firewall_source_ips" {
  type        = list(string)
  default     = ["0.0.0.0/0", "::/0"]
  description = "Source networks that have access to Coolify."
}
