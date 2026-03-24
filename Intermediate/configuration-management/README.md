# Configuration Management

Write an Ansible playbook to configure a Linux server.

## Prerequisites

- AWS EC2 instance with SSH access
- [uv](https://github.com/astral-sh/uv)

## Setup

```bash
uv sync
source .venv/bin/activate
```

## Configuration

Copy `vars.example.yml` to `vars.yml` and fill in the values:

```bash
cp vars.example.yml vars.yml
```

```yaml
ssh_public_key: "ssh-ed25519 AAAA..."
app_tarball: "./app.tar.gz"
```

Update `inventory.ini` with your server details:

```ini
[servers]
ec2 ansible_host=<server-ip> ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/<keyname>.pem
```

## Usage

Create a tarball of your static site:

```bash
tar -czf app.tar.gz -C mysite .
```

Run all roles:

```bash
ansible-playbook setup.yml
```

Run a specific role:

```bash
ansible-playbook setup.yml --tags "base"
ansible-playbook setup.yml --tags "ssh"
ansible-playbook setup.yml --tags "nginx"
ansible-playbook setup.yml --tags "app"
```

## Roles

- `base` : updates packages, installs utilities and fail2ban
- `ssh` : adds public key to authorized_keys
- `nginx` : installs and configures nginx
- `app` : uploads and extracts the static site tarball to `/var/www/app`

## Project

https://roadmap.sh/projects/configuration-management