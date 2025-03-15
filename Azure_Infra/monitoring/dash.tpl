{
  "lenses": {
    "0": {
      "order": 0,
      "parts": {
        "0": {
          "position": {
            "x": 0,
            "y": 0,
            "colSpan": 6,
            "rowSpan": 6
          },
          "metadata": {
            "inputs": {
              "0": {
                "name": "resourceType",
                "value": "Microsoft.Resources/resources"
              }
            },
            "type": "Extension/HubsExtension/PartType/BrowseAllResourcesPinnedPart",
            "viewState": {
              "content": {
                "selectableData": {}
              }
            }
          }
        },
        "1": {
          "position": {
            "x": 6,
            "y": 0,
            "colSpan": 7,
            "rowSpan": 3
          },
          "metadata": {
            "inputs": {
              "0": {
                "name": "resourceType",
                "value": "Microsoft.Resources/subscriptions/resourcegroups",
                "isOptional": true
              },
              "1": {
                "name": "filter",
                "isOptional": true
              },
              "2": {
                "name": "scope",
                "isOptional": true
              },
              "3": {
                "name": "kind",
                "isOptional": true
              }
            },
            "type": "Extension/HubsExtension/PartType/BrowseResourceGroupPinnedPart"
          }
        },
        "2": {
          "position": {
            "x": 6,
            "y": 3,
            "colSpan": 7,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": {
              "0": {
                "name": "options",
                "isOptional": true
              },
              "1": {
                "name": "sharedTimeRange",
                "isOptional": true
              }
            },
            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
            "settings": {
              "content": {
                "options": {
                  "chart": {
                    "metrics": {
                      "0": {
                        "resourceMetadata": {
                          "id": "/subscriptions/62b09e3e-94ad-40bd-864a-165fc0a5d1e2/resourceGroups/mc_infrastructure_chatapp-uw2_westus2/providers/Microsoft.Network/loadBalancers/kubernetes"
                        },
                        "name": "PacketCount",
                        "aggregationType": 1,
                        "namespace": "microsoft.network/loadbalancers",
                        "metricVisualization": {
                          "displayName": "Packet Count",
                          "resourceDisplayName": "kubernetes"
                        }
                      }
                    },
                    "title": "Sum Packet Count for LoadBalancer",
                    "titleKind": 2,
                    "visualization": {
                      "chartType": 2,
                      "legendVisualization": {
                        "isVisible": true,
                        "position": 2,
                        "hideHoverCard": false,
                        "hideLabelNames": true
                      },
                      "axisVisualization": {
                        "x": {
                          "isVisible": true,
                          "axisType": 2
                        },
                        "y": {
                          "isVisible": true,
                          "axisType": 1
                        }
                      },
                      "disablePinning": true
                    }
                  }
                }
              }
            }
          }
        },
        "3": {
          "position": {
            "x": 0,
            "y": 6,
            "colSpan": 2,
            "rowSpan": 1
          },
          "metadata": {
            "inputs": {},
            "type": "Extension/Microsoft_Azure_Health/PartType/ServiceIssuesPinnedPart"
          }
        },
        "4": {
          "position": {
            "x": 2,
            "y": 6,
            "colSpan": 2,
            "rowSpan": 1
          },
          "metadata": {
            "inputs": {
              "0": {
                "name": "selectedMenuItemId",
                "value": "",
                "isOptional": true
              }
            },
            "type": "Extension/HubsExtension/PartType/GalleryTile"
          }
        }
      }
    }
  },
  "metadata": {
    "model": {
      "timeRange": {
        "value": {
          "relative": {
            "duration": 24,
            "timeUnit": 1
          }
        },
        "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
      },
      "filterLocale": {
        "value": "en-us"
      },
      "filters": {
        "value": {
          "MsPortalFx_TimeRange": {
            "model": {
              "format": "utc",
              "granularity": "auto",
              "relative": "24h"
            },
            "displayCache": {
              "name": "UTC Time",
              "value": "Past 24 hours"
            },
            "filteredPartIds": {
              "0": "StartboardPart-MonitorChartPart-54a7b951-b552-420c-aa6d-324c3983430f"
            }
          }
        }
      }
    }
  }
}
