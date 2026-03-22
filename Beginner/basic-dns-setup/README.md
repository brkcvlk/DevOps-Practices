# Basic DNS Setup

Purchase a custom domain and setup basic DNS records

## Task 1 - Custom Domain for GitHub Pages

### 1. Add A records

In your domain provider's DNS settings, add 4 `A` records pointing to GitHub Pages IPs:

| Type | Name | Content |
|------|------|---------|
| A | @ | 185.199.108.153 |
| A | @ | 185.199.109.153 |
| A | @ | 185.199.110.153 |
| A | @ | 185.199.111.153 |

### 2. Add CNAME record

| Type | Name | Content |
|------|------|---------|
| CNAME | www | \<username\>.github.io |

### 3. Configure GitHub Pages

Go to repository **Settings -> Pages -> Custom domain**, enter your domain and save. GitHub will automatically provision an SSL certificate.

---

## Task 2 - Custom Domain for Remote Server

### 1. Add A record

| Type | Name | Content |
|------|------|---------|
| A | @ | <server-ip> |
| CNAME | www | yourdomain.com |

### 2. Update Nginx config

```bash
sudo nano /etc/nginx/conf.d/mysite.conf
```

```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    root /var/www/mysite;
    index index.html;
}
```

```bash
sudo systemctl reload nginx
```

## Project

https://roadmap.sh/projects/basic-dns