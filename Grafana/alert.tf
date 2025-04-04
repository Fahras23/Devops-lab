module "example" {
    source = "./modules/alert"
    providers = {
        grafana = module.root
    }

    folder_name = "example"
    alert_name = "example"

}