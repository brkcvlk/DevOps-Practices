# EC2 Instance

Create an EC2 instance on AWS and connect to it using SSH.

## Steps

### 1. Launch EC2 Instance

- Go to AWS Console -> EC2 -> Launch Instance
- Select Amazon Linux AMI
- Choose `t2.micro` (free tier)
- Create a new key pair (ED25519), download the `.pem` file
- Configure security group to allow inbound traffic on ports `22` (SSH) and `80` (HTTP)
- Launch the instance

### 2. Connect via SSH

```bash
chmod 400 ~/.ssh/key1.pem
ssh -i ~/.ssh/key1.pem ec2-user@<public-ip>
```

### 3. Install Nginx

```bash
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

### 4. Deploy Static Site

Create your HTML file on the server:

```bash
sudo mkdir -p /var/www/mysite
sudo chown ec2-user:ec2-user /var/www/mysite
nano /var/www/mysite/index.html
```

Configure Nginx:

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

### 5. Access the Website

```
http://<public-ip>
```

## Project

https://roadmap.sh/projects/ec2-instance