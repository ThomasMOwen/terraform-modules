# Terraform Modules

## Aim of the Project
The aim of this project was to create a terraform config example that used local terraform modules, and a validation workflow to ensure security and validity of terraform config. It would be configured to run entirely within containers and would require no local installation other than Docker

Gitea was used to run the validation workflow. However, it can be switched to a GitHub action by creating the `.github/workflows` directory and moving the workflow file there.

---

## Platform Components

| Component | Image | Purpose |
|---|---|---|
| Terraform | hashicorp/terraform:latest | IaC Tool |
| Trivy | aquasec/trivy:latest | Security scanning tool |
| Tflint | ghcr.io/terraform-linters/tflint:latest | Terraform linter |
| Gitea | gitea/gitea:main-nightly | Repo and CI/CD tool, can be switched to GitHub and GitHub actions |

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Git](https://git-scm.com/)

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/ThomasMOwen/terraform-modules.git
cd terraform-modules
```

### 2. Create the gitea instance (optional if using gitea)

```bash
make gitea
```

This creates the gitea instance and action runner required for CI/CD using docker compose and the config in compose.yml file

### 3. Access the platform

|`https://localhost:3000` | Set up an admin user and then login |


### 4. Connect the runner

1. In Gitea, go to Site Administration → Actions → Runners
2. Click Create new Runner and copy the token
3. In your Compose file: replace {Registration Token} with the token copied
4. Run `docker compose restart runner`

---

## Repository Structure

```
terraform-modules/
│
├── example/                   # Example configuration to test
│   ├── terraform.tf            
│   ├── main.tf 
│   ├── variables.tf   
│   └── terraform.tfvars       # Variables for the example configuration
│
├── modules/                   # Module configurations
│   ├── docker-app/
│   └── docker-network/
|
├── .gitea/                    # Configuration for gitea repo (can be switched to config for github)
│   ├── workflow/
│       └── ci.yml             # CI workflow for running checks against terraform config changes
|
├── compose.yml                # Compose file to set up a local gitea instance
├── config.yaml                # Config for the gitea runner, to ensure it spins up containers in the same docker network
├── makefile                   # Makefile for running commands used in workflow locally
└── README.md
```

---

## Key Concepts Demonstrated

### Terraform Modules

Modules were created to abstract the creation of a docker network and apps run in docker. Variables were passed to the modules and outputs captured from the network module to be used by the app containers.

### Quality Check Workflow for Terraform Configuration

The validation.yml workflow constains stages to ensure the terraform config is valid, consistent and secure.

---



## What I'd Do Next

- **GitHub Workflows** - move workflow to use GitHub infrastructure and expand the workflow to contain plan stage.
- **Remote Backend for Terraform** - move from a locally stored backend to a remote one that supports state locking.
- **Experiment to cloud infrastructure** - using emulators such as Floci, experiment with creating and implementing modules for cloud infrastructure.


---

## Known Limitations

- Local Git Hosting - Workflow currently runs in a locally run Git instance.
- Local Terraform Backend - terraform backend would use a local statefile.