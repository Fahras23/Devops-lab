resource "grafana_folder" "rule_folder" {
  title = var.folder_name
}

resource "grafana_rule_group" "my_alert_rule" {
  count =  var.enable_alert ? 1 : 0
  name             = "My Rule Group"
  folder_uid       = grafana_folder.rule_folder.uid
  org_id           = 1
  interval_seconds = 60

  rule {
    name      = "Namespaces"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "behtturun0phcf"
      model          = "{\"editorMode\":\"code\",\"expr\":\"sum(count(kube_namespace_created) by (namespace))\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations    = {}
    labels         = {}
    is_paused      = false

    notification_settings {
      contact_point = "grafana-default-email"
      group_by      = null
      mute_timings  = null
    }
  }
}