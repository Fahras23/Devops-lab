resource "grafana_organization" "my_org_2" {
  name = "my_org_2"
}

// Create resources (optional: within the organization)
resource "grafana_folder" "my_folder" {
  org_id = grafana_organization.my_org_2.org_id
  title  = "Test Folder"
}

resource "grafana_dashboard" "test_folder" {
  org_id = grafana_organization.my_org.org_id
  folder = grafana_folder.my_folder.id
  config_json = jsonencode({
    "title" : "My Dashboard Title",
    "uid" : "my-dashboard-uid"
    // ... other dashboard properties
  })
}