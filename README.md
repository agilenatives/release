# release

![docker](https://github.com/agilenatives/release/workflows/docker/badge.svg?branch=master)

Docker images for different cloud providers that can be used for continuous deployment pipelines.
The installed tools are:

- Cloud Provider CLI like az, doctl or hcloud
- Terraform
- Kubectl
- Helm

## Usage

Azure DevOps
```
jobs:
- job: release
  ...
  container: agilenatives/release:azure
  steps:
  - bash: az login --service-principal ...
```

GitLab
```
stages:
...
- release
...
release:
  stage: release
  image: agilenatives/release:azure
  ...
  script:
  - az login --service-principal ...
```

## Tags

- `agilenatives/release:azure`
- `agilenatives/release:azure-alpine`
- `agilenatives/release:digitalocean`
- `agilenatives/release:digitalocean-alpine`
- `agilenatives/release:hetzner`
- `agilenatives/release:hetzner-alpine`