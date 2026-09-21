variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "network_driver" {
  description = "Driver to be used by the network"
  type        = string
  default     = "bridge"
}

