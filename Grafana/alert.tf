module "example" {
    source = "./modules/alert"
    providers = {
      grafana = grafana.root
    }

    enable_alert = true

    folder_name = "example"
    alert_name = "example"

}