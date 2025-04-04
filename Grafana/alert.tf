module "example" {
    source = "./modules/alert"

    grafana_url_module = var.grafana_url
    grafana_auth_module = var.grafana_auth

    folder_name = "example"
    alert_name = "example"

}