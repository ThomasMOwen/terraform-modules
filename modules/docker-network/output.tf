output "network_id" {
  description = "Docker Network ID"
  value       = docker_network.private_network.id
}