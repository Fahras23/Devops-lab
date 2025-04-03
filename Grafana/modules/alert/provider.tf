terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "3.20.0"
    }
  }
}


provider "grafana" {
  alias = "module"
}