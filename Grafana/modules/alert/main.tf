resource "grafana_folder" "rule_folder" {
  title = var.folder_name
}

resource "grafana_contact_point" "email_alert" {
  name = "email-alerts"

  email {
    addresses = ["2001krzysztoflyczak@gmail.com"]
    message   = "Alert: {{ .CommonLabels.alertname }} - {{ .CommonAnnotations.summary }}"
    subject   = "Grafana Alert: {{ .CommonLabels.alertname }}"
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
    condition = "A"  # Directly reference the query result

    # Single data block: Query + Threshold in one step
    data {
      ref_id = "A"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "behtturun0phcf"  # Your metrics datasource (e.g., Prometheus)
      model = jsonencode({
        expr          = "sum(count(kube_namespace_created) by (namespace))",
        intervalMs    = 1000,
        maxDataPoints = 43200,
        refId         = "A",
        # Embedded threshold condition
        conditions = [{
          evaluator = {
            params = [9],  # Threshold value
            type   = "gt"  # Alert if > 9
          },
          operator  = { type = "and" },
          query     = { params = ["A"] },  # Self-reference
          reducer   = { type = "last" },
          type      = "query"
        }]
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    is_paused      = false

    notification_settings {
    contact_point = grafana_contact_point.email_alert.name  # Reference the contact point
    group_by      = ["..."]  # Optional: Group alerts by labels
    }
  }
}