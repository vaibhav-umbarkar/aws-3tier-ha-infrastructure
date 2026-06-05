# AWS 3-Tier Highly Available Infrastructure with Terraform

A production-style AWS infrastructure project built using **Terraform (Infrastructure as Code)** that demonstrates a secure, scalable, and highly available **3-tier architecture** across multiple Availability Zones.

This project showcases industry-standard cloud architecture patterns and DevOps best practices for deploying enterprise-grade applications on AWS.

---

## Overview

This repository provisions a complete 3-tier infrastructure consisting of:

- **Presentation Layer (Web Tier)** – Public-facing services
- **Application Layer (App Tier)** – Internal business logic services
- **Data Layer (Database Tier)** – Secure and isolated database services

The architecture is designed for:

- High Availability (Multi-AZ deployment)
- Scalability using Auto Scaling Groups
- Security through network segmentation and Security Groups
- Infrastructure automation using Terraform modules
- Real-world DevOps and cloud engineering practices

---

## Architecture

![AWS 3-Tier Architecture](diagram.webp)

### Network Design

| Component | Description |
|-----------|-------------|
| VPC | Custom VPC (10.0.0.0/16) |
| Availability Zones | Multi-AZ deployment (ap-south-1a & ap-south-1b) |
| Public Subnets | Internet-facing resources |
| Private Subnets | Application and database resources |
| Security Groups | Controlled communication between tiers |

---

## Infrastructure Components

### Web Tier (Public Layer)

- Internet Gateway
- Public Application Load Balancer (ALB)
- NAT Gateway
- Bastion Host
- Auto Scaling Group for Web Servers

### Application Tier (Private Layer)

- Internal Application Load Balancer
- Auto Scaling Group for Application Servers
- Private networking with no direct internet access

### Database Tier (Private Layer)

- Amazon RDS
- Isolated database subnets
- Multi-AZ ready deployment

---

## Traffic Flow

1. Users access the application through the Internet.
2. Requests enter the VPC via the Internet Gateway.
3. The Public ALB distributes traffic across Web Tier instances.
4. Web servers forward requests to the Internal ALB.
5. The Internal ALB routes traffic to Application Tier instances.
6. Application servers communicate securely with the Database Tier.
7. The database remains inaccessible from the public internet.

---

## AWS Services Used

- Amazon VPC
- Amazon EC2
- Auto Scaling Groups (ASG)
- Application Load Balancer (ALB)
- Amazon RDS
- NAT Gateway
- Internet Gateway
- IAM
- Security Groups

---

## Technology Stack

- Terraform
- AWS
- Bash

---

## 👤 Dev

- Modular Terraform design
- Highly available Multi-AZ architecture
- Secure network segmentation
- Scalable application deployment
- Production-oriented infrastructure layout
- Suitable for DevOps and Cloud Engineering portfolios

---

## Getting Started

```bash
terraform init
terraform plan
terraform apply
```

> Ensure AWS credentials and required Terraform variables are configured before deployment.

---

## Learning Objectives

This project helps you understand:

- AWS networking fundamentals
- Infrastructure as Code (IaC)
- Terraform module design
- High availability architecture
- Security best practices on AWS
- Enterprise cloud deployment patterns

---

## Author

**Vaibhav Umbarkar**

DevOps Engineer | AWS | Terraform
