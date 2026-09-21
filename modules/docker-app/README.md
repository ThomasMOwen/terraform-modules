# Docker App Module

This module is used to provision docker apps within the network

# Example Usage

```
module "app" {
  source = "./modules/docker-app"

  providers = {
    docker = docker
  }

  image        = "nginx:latest"
  app_name     = "example-app"
  ports        = 80
  network_name = "example-network"

}
```