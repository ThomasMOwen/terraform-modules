variable "container_details" {
  type = list(object({
    name = string
    port = number
  }))
  default = [
    {
      name = "test-app-1"
      port = 80
    },
    {
      name = "test-app-2"
      port = 90
    }

  ]
  validation {
    condition     = length(var.container_details) == 2
    error_message = "This application should have two instances running at any one time"
  }
}