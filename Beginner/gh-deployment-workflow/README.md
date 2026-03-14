# GitHub Pages Deployment

Write a simple GitHub Actions workflow to deploy a static website to GitHub Pages.

## How it works

Every push to `main` that changes `index.html` triggers the workflow and deploys the site automatically.

## Setup

1. Go to repository **Settings -> Pages**
2. Set source to **GitHub Actions**
3. Push a change to `index.html`

The site will be live at:
```
https://<username>.github.io/gh-deployment-workflow/
```

## Project

https://roadmap.sh/projects/github-actions-deployment-workflow