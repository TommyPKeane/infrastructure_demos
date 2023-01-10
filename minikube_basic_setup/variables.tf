variable "cluster_ip" {
  type = string
  validation {
    condition = can(
      regex(
        "^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
        var.cluster_ip,
      )
    )
    error_message = "Must be a valid IPv4 CIDR block address."
  }
}

variable "cluster_port" {
  type = number

  validation {
    condition     = var.cluster_port <= 65535
    error_message = "Port Number must be in range of [0, 2^16-1] doubly-inclusive (maximum value: 65,535)"
  }
}
