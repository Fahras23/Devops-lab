module "example" {
    source = "./modules/alert"
    providers = {
      grafana.auth
    }
    folder_name = "example"
    alert_name = "example"

}