module "example" {
    source = "./modules/alert"
    providers = {
        grafana = provider.root
    }

    folder_name = "example"
    alert_name = "example"

}