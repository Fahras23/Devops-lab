module "example" {
    source = "./modules/alert"
    providers = {
      grafana = grafana.root
    }

    enable_alert = true

    folder_name = "Cluster"
    alert_name = "Namespace count changed"

}