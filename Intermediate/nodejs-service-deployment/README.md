# Node.js Service Deployment
Use GitHub Actions to Deploy a Python/FastAPI Service to a remote server

## Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
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
cp terraform/terraform.tfvars.example terraform/terraform.tfvars
```
```hcl
aws_region      = "us-east-1"
ami_id          = "ami-xxxxxxxxxxxxxxxxx"
key_name        = "my-key"
public_key_path = "~/.ssh/my-key.pub"
```

## Usage

Provision the server:
```bash
cd terraform
terraform init
terraform apply
```

`terraform apply` will automatically generate `ansible/inventory.ini` with the EC2 public IP.

Connect to the instance:
```bash
ssh -i ~/.ssh/my-key ec2-user@<instance_ip>
```

Deploy the application manually:
```bash
cd ansible
ansible-playbook node_service.yml --tags app
```

Access the application:
```
http://<instance_ip>
```

Destroy the infrastructure:
```bash
terraform destroy
```

## CI/CD
Push to `main` branch under `Intermediate/nodejs-service-deployment/**` triggers automatic deployment via GitHub Actions.

Required GitHub Secrets:

| Secret | Description |
|--------|-------------|
| `INSD_SSH_KEY` | Private SSH key content |
| `INSD_HOST` | EC2 public IP address |

## Project
https://roadmap.sh/projects/nodejs-service-deployment