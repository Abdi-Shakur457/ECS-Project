# ECS End To End Fargate Deployment Project on Threat Composer Application 

## Overview

This project demonstrates a fully automated cloud-native deployment pipeline using AWS ECS Fargate, Docker, Terraform, and GitHub Actions.

The application was containerised using a multi-stage Docker build and deployed onto AWS ECS Fargate behind an Application Load Balancer inside a secure multi-AZ VPC architecture.

I chose ECS Fargate instead of EC2 to avoid managing servers manually and to take advantage of a serverless container platform that automatically handles scaling and infrastructure management.

Infrastructure provisioning was automated using Terraform, while CI/CD pipelines were implemented using GitHub Actions.

---

# Architecture



<img width="543" height="340" alt="MY ECS PROJECT DIAGRAM" src="https://github.com/user-attachments/assets/f05085ea-9dbe-42ec-96eb-d1530958d5b0" />



---

# Features

- Multi-stage Docker containerisation
- ECS Fargate deployment
- Application Load Balancer
- Public and private subnet architecture
- Terraform Infrastructure as Code
- CI/CD with GitHub Actions
- Cloudflare DNS integration
- CloudWatch logging and monitoring
- Remote Terraform state using S3 + DynamoDB locking

---

# CI/CD Pipelines

## Build & Push Pipeline
- Builds Docker image
- Tags image using Git SHA
- Pushes image to Amazon ECR

## Deploy Pipeline
- Deploys infrastructure using Terraform
- Updates ECS services and task definitions

## Destroy Pipeline
- Safely destroys infrastructure
- Scales ECS services down before destroy

---

# Repository Structure

```bash
ecs-project/
│
├── app/
│
├── dockerfile
├── yarn.lock
├── terraform.tfstate
│
├── infra/
│   ├── backend.tf
│   ├── main.tf
│   ├── output.tf
│   ├── terraform.tfvars
│   ├── variables.tf
│   │
│   └── modules/
│       ├── acm/
│       ├── alb/
│       ├── cloudflare/
│       ├── cloudflare_validation/
│       ├── ecr/
│       ├── ecs/
│       ├── iam/
│       └── vpc/
