# DevOps Lab

Personal hands-on lab showcasing a complete DevOps workflow on Azure AKS. This repository contains infrastructure code, Kubernetes manifests, GitOps configurations, and monitoring setups for learning and experimentation. Created mainly for purpuse of hosting a personal chat application.

## 📋 What You'll Find Here

**Azure Infrastructure (IaC)**
- `Azure_Infra/aks_cluster/`: Terraform modules to provision AKS cluster, VNet, and networking
- `Azure_Infra/monitoring/`: Azure storage and dashboard configurations
- `Grafana/`: Terraform for Grafana alerting with reusable modules

**Kubernetes Applications**
- `Apps/chatapp/`: Sample chat application with base manifests + beta/prod overlays (Kustomize)
- `Apps/monitoring/`: Full observability stack - Prometheus, Grafana, Elasticsearch, Fluent Bit
- `Apps/argocd/`: Argo CD configuration

**GitOps with Argo CD**
- `Argocd/`: Application definitions for automated deployments of chatapp (beta/prod) and monitoring

**Helm Configurations**
- `Helm_Values/`: Custom values for Elasticsearch and Fluent Bit deployments

**Testing**
- `Tests/script.js`: Application health checks and smoke tests

## 🎯 What This Lab Contains

- **Cloud Infrastructure**: Azure AKS cluster provisioning with Terraform
- **GitOps**: Argo CD for continuous deployment of applications
- **Observability**: Complete monitoring stack (metrics + logs + alerts)
- **Multi-environment**: Beta/Production deployments with overlays
- **Modern Practices**: Kustomize, Helm values, modular Terraform

## 🔮 Current Focus

Building and experimenting with production-grade DevOps patterns including:
- Extend build of infrastructure in azure
- Add and optimize Full-stack monitoring (Prometheus|FluentBit + Grafana + ELK)
- Multi-environment Kubernetes deployments with local one for testing and cloud one for production