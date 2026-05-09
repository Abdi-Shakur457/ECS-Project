ECS Fargate Deployment Project

This project demonstrates a fully automated cloud-native deployment pipeline using AWS ECS Fargate, Docker, Terraform, and GitHub Actions.

The application was containerised using a multi-stage Docker build and deployed onto AWS ECS Fargate behind an Application Load Balancer inside a secure multi-AZ VPC architecture.

I chose ECS Fargate instead of EC2 to avoid managing servers manually and to take advantage of a serverless container platform that automatically handles scaling and infrastructure management.

Infrastructure provisioning was automated using Terraform, while CI/CD pipelines were implemented using GitHub Actions.

Architecture

Add architecture diagram here

Features
Multi-stage Docker containerisation
ECS Fargate deployment
Application Load Balancer
Public and private subnet architecture
Terraform Infrastructure as Code
CI/CD with GitHub Actions
Cloudflare DNS integration
CloudWatch logging and monitoring
Remote Terraform state with S3 + DynamoDB locking
CI/CD Pipelines
Build & Push Pipeline
Builds Docker image
Tags image using Git SHA
Pushes image to Amazon ECR
Deploy Pipeline
Deploys infrastructure using Terraform
Updates ECS services/tasks
Destroy Pipeline
Safely destroys infrastructure
Scales ECS services down before destroy
Repository Structure
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
Technologies Used
Docker
Amazon ECS Fargate
Amazon ECR
Terraform
GitHub Actions
Cloudflare
AWS ALB
AWS IAM
AWS ACM
Amazon CloudWatch
Lessons Learned

Through this project I gained practical experience with:

Containerisation
Infrastructure as Code
AWS networking
ECS Fargate deployments
Terraform state management
CI/CD automation
Cloud-native troubleshooting
