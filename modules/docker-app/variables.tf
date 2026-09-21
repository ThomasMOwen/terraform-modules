variable "app_name" {
  description = "The name for the container running the app"
  type        = string
}

variable "image" {
  description = "The image required for the app"
  type        = string
}

variable "ports" {
  description = "Ports for the container to use"
  type        = number
}

variable "network_name" {
  description = "The network name for the container to attach to"
  type        = string
}