module "example" {
    source = "./modules/alert"
    
    folder_name = "example"
    alert_name = "example"
    
    grafana_url = var.grafana_url
    grafana_auth = var.grafana_auth

}