module "example" {
    source = "./modules/alert"
    providers = {
      grafana = grafana.root
    }

    enable_alert = true

    folder_name = "Namespace count changed"
    alert_name = "Cluster"

}