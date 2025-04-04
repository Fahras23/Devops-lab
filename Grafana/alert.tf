module "example" {
    source = "./modules/alert"
    
    grafana_url = var.grafana_url
    grafana_url = var.grafana_auth
    
    folder_name = "example"
    alert_name = "example"

}