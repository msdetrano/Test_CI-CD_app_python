terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.2.0"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "default" {
  name = "lab-devops"
  node_image = "kindest/node:v1.27.3"
  wait_for_ready = true

  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
      # Mapeamento de porta para acessar serviços via localhost
      extra_port_mappings {
        container_port = 30000 # Exemplo para NodePort
        host_port      = 30000
      }
    }
    node {
      role = "worker"
    }
  }
}