provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_auth
}

module "example" {
    source = "./modules/alert"
    
    folder_name = "example"
    alert_name = "example"

}