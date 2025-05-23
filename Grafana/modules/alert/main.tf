resource "grafana_folder" "rule_folder" {
  title = var.folder_name
}

resource "grafana_contact_point" "email_alert" {
  name = "critical-email"

  email {
    addresses = ["kalycz223@gmail.com"]
    message   = <<-EOT
      Alert: {{ .CommonLabels.alertname }}
      Value: {{ .Values.B.Value }}
      Instance: {{ .CommonLabels.instance }}
    EOT
    subject   = "ALERT: {{ .CommonLabels.alertname }}"
  }
}

resource "grafana_rule_group" "my_alert_rule" {
  count            = var.enable_alert ? 1 : 0
  name             = "My Rule Group"
  folder_uid       = grafana_folder.rule_folder.uid
  org_id           = 1
  interval_seconds = 60

  rule {
    name      = var.alert_name
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "deiab3tfasoaoa"
      model          = "{\"editorMode\":\"code\",\"expr\":\"sum(count(kube_namespace_created) by (namespace))\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[9],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations    = {}
    labels         = {}
    is_paused      = false

    notification_settings {
      contact_point = grafana_contact_point.email_alert.name
    }
  }
}