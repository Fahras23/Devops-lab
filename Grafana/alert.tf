module "example" {
    source = "./modules/alert"
    providers = {
        grafana = grafana.root
    }

    folder_name = "example"
    alert_name = "example"

}