module "example" {
    source = "./modules/alert"
    providers = {
        grafana = grafana.root
    }

    grafana_url = TF_VAR_grafana_url
    grafana_auth = TF_VAR_grafana_auth
    
    folder_name = "example"
    alert_name = "example"

}