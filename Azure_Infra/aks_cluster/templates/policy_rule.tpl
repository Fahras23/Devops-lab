  {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.ContainerService/managedClusters/agentPools"
        },
        {
          "not": {
            "field": "Microsoft.ContainerService/managedClusters/agentPools/vmSize",
            "equals": "Standard_D2s_v4"
          }
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  }