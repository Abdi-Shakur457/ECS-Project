#  Threat Composer – Production-Grade AWS ECS Fargate Platform
## Overview
This project demonstrates a fully automated CI/CD pipeline deployed on AWS using ECS Fargate, Docker, Terraform, and GitHub Actions.

The project, “Threat Composer”, is a web application that I containerised and deployed as a real-world workload to demonstrate end-to-end CI/CD, infrastructure automation, and cloud-native deployment on AWS.

The application is containerised using a multi-stage Docker build and deployed to AWS ECS Fargate behind an Application Load Balancer in a secure multi-AZ VPC.

Infrastructure is fully defined using Terraform (Infrastructure as Code), enabling consistent and repeatable deployments across environments.

The CI/CD pipeline is implemented using GitHub Actions, where Docker images are built, tagged using the Git commit SHA, pushed to Amazon ECR, and then deployed to ECS.

ECS Fargate was chosen over EC2 to remove the need for server management, with AWS handling scaling, provisioning, and infrastructure maintenance automatically.

---

## HTTPS Access to Domain Success 




<img width="1904" height="1078" alt="Application" src="https://github.com/user-attachments/assets/fa906b79-1893-46af-9fdb-0b6aaf8462d4" />





---

# AWS Architecture Diagram



<img width="1904" height="1078" alt="MY ECS PROJECT DIAGRAM" src="https://github.com/user-attachments/assets/f05085ea-9dbe-42ec-96eb-d1530958d5b0" />



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


<img width="1904" height="1078" alt="pipeline 1 success" src="https://github.com/user-attachments/assets/d8e718d0-7e06-4a14-b9fa-b5564466f578" />



---
## Deploy Pipeline
- Deploys infrastructure using Terraform
- Updates ECS services and task definitions


<img width="1904" height="1078" alt="pipeline 2 success" src="https://github.com/user-attachments/assets/2c79afe9-aa81-4c56-8ad0-2e51a880031e" />


---
## Destroy Pipeline
- Safely destroys infrastructure
- Scales ECS services down before destroy


<img width="1904" height="1078" alt="pipeline 3 " src="https://github.com/user-attachments/assets/e48bf617-3188-4326-8b58-86963abed170" />



---

# 📁 Local Development Environment Structure

```bash
ecs-project/
│
├── app/
│
├── dockerfile
├── .dockerignore
├── .gitignore
├── terraform.tfstate
├── yarn.lock
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
│
└── .github/
    └── workflows/
        ├── build.yml
        ├── deploy.yml
        └── destroy.yml

```

---

## 🔄 How It Works

1. Developer pushes code to GitHub  
2. GitHub Actions builds Docker image  
3. Image is tagged using Git SHA  
4. Image is pushed to Amazon ECR  
5. Terraform deploys infrastructure (ECS Fargate + ALB)  
6. ECS pulls latest image and runs the container  
7. Application is exposed via ALB public DNS  

---

## 🚀 How to Run the Application Locally

If you want to run the application locally instead of using the deployed AWS version:

### Step 1: Clone the repository
```bash
git clone https://github.com/Abdi-Shakur457/threat-composer-fargate.git
```

### Step 2: Navigate into the app folder
```bash
cd app
```

### Step 3: Build Docker image
```bash
docker build -t threat-composer-app .
```

### Step 4: Run container locally
```bash
docker run -p 3000:3000 threat-composer-app
```

### Step 5: Open in browser
```
http://localhost:3000
```

---

## 🧰 Requirements

- Docker installed  
- AWS account (for deployed version)  
- Terraform (only if modifying infrastructure)
