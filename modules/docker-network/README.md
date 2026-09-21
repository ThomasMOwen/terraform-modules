# Docker Network Module

This module provisions the docker network that will be used by the docker hosted applications

# Example Usage

```
module "docker_network" {
  source       = "./modules/docker-network"

  providers = {
    docker = docker
  }

  network_name = "example_network"
}
```