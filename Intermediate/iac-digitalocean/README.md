# IaC on AWS
Write Terraform code to create a EC2 Instance on AWS

## Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)

## Setup
Configure AWS credentials:
```bash
aws configure
```

Generate SSH key:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/my-key
```

## Configuration
Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in the values:
```bash
cp terraform.tfvars.example terraform.tfvars
```
```hcl
aws_region      = "us-east-1"
ami_id          = "ami-xxxxxxxxxxxxxxxxx"
key_name        = "my-key"
public_key_path = "~/.ssh/my-key.pub"
```

## Usage
```bash
terraform init
terraform plan
terraform apply
```

Connect to the instance:
```bash
ssh -i ~/.ssh/my-key ec2-user@<instance_ip>
```

Destroy the infrastructure:
```bash
terraform destroy
```

## Project
https://roadmap.sh/projects/iac-digitalocean