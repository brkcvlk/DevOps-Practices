# Dockerized Service Deployment
Use GitHub Actions to Deploy a Dockerized Python/FastAPI Service

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Hub Account](https://hub.docker.com/)

## Setup

Generate SSH key:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/my-key
```

## Configuration
Copy `.env.example` to `.env` and fill in the values:
```bash
cp .env.example .env
```
```dotenv
SECRET_MESSAGE=your-secret-message
APP_USERNAME=admin
APP_PASSWORD=supersecret123
```

## Usage

Build and run locally:
```bash
docker build -t fastapi-service .
docker run --env-file .env -p 8000:8000 fastapi-service
```

Test the endpoints:
```bash
# Public route
curl http://localhost:8000/

# Protected route
curl -u admin:supersecret123 http://localhost:8000/secret
```

Destroy the container:
```bash
docker stop fastapi-service && docker rm fastapi-service
```

## CI/CD
Push to `main` branch under `Intermediate/dockerized-service-deployment/**` triggers automatic deployment via GitHub Actions.

Required GitHub Secrets:

| Secret | Description |
|--------|-------------|
| `IDSD_SSH_KEY` | Private SSH key content |
| `IDSD_HOST` | Remote server IP address |
| `IDSD_USER` | Remote server SSH user |
| `IDSD_DOCKER_USERNAME` | Docker Hub username |
| `IDSD_DOCKER_PASSWORD` | Docker Hub password / token |
| `IDSD_SECRET_MESSAGE` | App secret message |
| `IDSD_APP_USERNAME` | Basic Auth username |
| `IDSD_APP_PASSWORD` | Basic Auth password |

## Project
https://roadmap.sh/projects/dockerized-service-deployment