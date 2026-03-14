# Basic Dockerfile

Build a basic Dockerfile to create a Docker image.

## Usage

Build and run with default message:
```bash
docker build -t hello-captain .
docker run hello-captain
# Hello, Captain!
```

Build and run with a custom name:
```bash
docker build --build-arg NAME=Burak -t hello-captain .
docker run hello-captain
# Hello, Burak!
```

## Project

https://roadmap.sh/projects/basic-dockerfile