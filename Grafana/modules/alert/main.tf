resource "grafana_folder" "rule_folder" {
  title = var.folder_name
}

resource "grafana_rule_group" "my_alert_rule" {
  count =  var.enable_alert ? 1 : 0
  name             = "My Rule Group"
  folder_uid       = grafana_folder.rule_folder.uid
  interval_seconds = 240
  org_id           = 1
  rule {
    name           = var.alert_name
    for            = "2m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Alerting"
    labels = {
      "name" = "node_cpu"
    }
    is_paused = false
    data {
      ref_id     = "A"
      query_type = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "behtturun0phcf"
      model = jsonencode({
        hide          = false
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "A"
      })
    }
    data {
      ref_id     = "B"
      query_type = ""
      relative_time_range {
        from = 0
        to   = 0
      }
      datasource_uid = "behtturun0phcf"
      model = jsonencode({
        hide          = false
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "B"
        query = {
          params = ["sum(rate(node_cpu_seconds_total{node=\"aks-chatapp-33350159-vmss000000\"}[5m]))"]
        }
      })
    }
  }
}