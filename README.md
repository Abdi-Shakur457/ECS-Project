# ECS End To End Fargate Deployment Project on Threat Composer Application 

## Overview

This project demonstrates a fully automated cloud-native deployment pipeline using AWS ECS Fargate, Docker, Terraform, and GitHub Actions.

The application was containerised using a multi-stage Docker build and deployed onto AWS ECS Fargate behind an Application Load Balancer inside a secure multi-AZ VPC architecture.

I chose ECS Fargate instead of EC2 to avoid managing servers manually and to take advantage of a serverless container platform that automatically handles scaling and infrastructure management.

Infrastructure provisioning was automated using Terraform, while CI/CD pipelines were implemented using GitHub Actions.


---

## HTTPS Access to Domain Success 




<img width="1904" height="1078" alt="Application" src="https://github.com/user-attachments/assets/fa906b79-1893-46af-9fdb-0b6aaf8462d4" />





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


<img width="434" height="329" alt="pipeline 1 success" src="https://github.com/user-attachments/assets/d8e718d0-7e06-4a14-b9fa-b5564466f578" />



---
## Deploy Pipeline
- Deploys infrastructure using Terraform
- Updates ECS services and task definitions


<img width="350" height="279" alt="pipeline 2 success" src="https://github.com/user-attachments/assets/2c79afe9-aa81-4c56-8ad0-2e51a880031e" />


---
## Destroy Pipeline
- Safely destroys infrastructure
- Scales ECS services down before destroy


<img width="419" height="310" alt="pipeline 3 " src="https://github.com/user-attachments/assets/e48bf617-3188-4326-8b58-86963abed170" />



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
