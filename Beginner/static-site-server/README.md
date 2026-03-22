# Static Site Server

Setting up a static site on AWS EC2 with Nginx and deploying with rsync.

## Prerequisites

- AWS EC2 instance (Amazon Linux)
- SSH access configured

## Setup

### 1. Install Nginx on the server

```bash
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

### 2. Create the site directory on the server

```bash
sudo mkdir -p /var/www/mysite
sudo chown ec2-user:ec2-user /var/www/mysite
```

### 3. Configure Nginx

```bash
sudo nano /etc/nginx/conf.d/mysite.conf
```

```nginx
server {
    listen 80;
    root /var/www/mysite;
    index index.html;
}
```

```bash
sudo systemctl reload nginx
```

### 4. Open HTTP port on AWS

Go to EC2 -> Security Groups -> Inbound rules -> Add rule:
- Type: HTTP
- Source: 0.0.0.0/0

### 5. Deploy the site

Update `<server-ip>` in `deploy.sh` with your EC2 address, then:

```bash
bash deploy.sh
```

## Project

https://roadmap.sh/projects/static-site-server