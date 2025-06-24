# GitOps-Driven-Kubernetes-Platform-on-AWS-using-Terraform


# 📘 GitOps-Driven Kubernetes Platform on AWS using Terraform

## 🚀 Overview
This project provisions a complete production-ready Kubernetes (EKS) platform on AWS using **Terraform**, integrated with **ArgoCD (GitOps)**, monitoring, logging, and CI/CD pipelines.

---

## 🛠️ Tech Stack
- **Terraform** (modular infrastructure as code)
- **AWS**: EKS, VPC, IAM, ALB, ACM, Route 53, CloudWatch
- **ArgoCD**: GitOps-based deployment
- **Helm**: Chart management for K8s apps
- **Prometheus + Grafana**: Monitoring
- **FluentBit + CloudWatch Logs**: Centralized logging
- **GitHub Actions / Jenkins**: CI/CD

---

## 🧱 Architecture
- Multi-AZ VPC
- Private/Public Subnets
- EKS Cluster with OIDC
- ArgoCD for app deployment
- Observability (Metrics + Logs)
- CI/CD integration

---

## 📁 Directory Structure
```
terraform-eks-platform/
├── modules/
├── envs/
├── ci-cd/
├── gitops/
├── observability/
└── README.md
```

---

## 🚧 Features
- Provision AWS infra with Terraform
- GitOps-based K8s deployments
- IRSA-secured service accounts
- TLS via ACM + custom domain
- CI/CD integration with auto deploy
 

