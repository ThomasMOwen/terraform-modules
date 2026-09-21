module "docker_network" {
  source = "../modules/docker-network"

  providers = {
    docker = docker
  }

  network_name = "test"
}

module "app" {
  source = "../modules/docker-app"

  providers = {
    docker = docker
  }
  for_each = { for container in var.container_details : container.name => container }

  image        = "nginx:latest"
  app_name     = each.value.name
  ports        = each.value.port
  network_name = module.docker_network.network_id

}

