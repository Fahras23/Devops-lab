resource "grafana_folder" "rule_folder" {
  title = var.folder_name
}

resource "grafana_rule_group" "my_alert_rule" {
  count =  var.enable_alert ? 1 : 0
  name             = "My Rule Group"
  folder_uid       = grafana_folder.rule_folder.uid
  org_id           = 1
  interval_seconds = 240

  rule {
    name      = "Namespace count changed"
    condition = "B"

    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "-100"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[3],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"sum(count(kube_namespace_created) by (namespace))\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"-100\"},\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"classic_conditions\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Alerting"
    for            = "2m"
    annotations = {
      a = "b"
      c = "d"
    }
    labels = {
      e = "f"
      g = "h"
    }
    is_paused = false
  }
}