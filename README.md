# bhs-task

# Azure Infrastructure Provisioning with Terraform and Ansible

This repository contains Terraform scripts along with Ansible playbooks for provisioning infrastructure on Azure, specifically targeting the deployment of a virtual machine (Ubuntu) with Docker and Nginx for hosting a custom webpage.

## Overview

The infrastructure setup includes:

- **Virtual Machine**: Ubuntu-based, provisioned with necessary configurations.
- **Network Components**: Creation of network resources ensuring secure communication.
- **Access Security**: SSH access with dedicated keys and firewall rules for added security.
- **Docker & Nginx**: Installation of Docker and deployment of an Nginx container serving a custom webpage.
- **Public Access**: Assignment of a public IP and DNS configuration for public accessibility.

## Usage

1. **Clone Repository**: Clone this repository to your local machine.
2. **Configure Azure Credentials**: Ensure Azure credentials are configured properly, either through Azure CLI authentication or using a service principal.
3. **Terraform Initialization**: Run `terraform init` to initialize the Terraform environment.
4. **Terraform Deployment**: Execute `terraform apply` to deploy the infrastructure.
5. **GitHub Actions Workflow**: Infrastructure deployment and configuration are automated through GitHub Actions workflow. Simply push your changes to trigger the workflow, and the infrastructure will be provisioned and configured accordingly.
6. **Accessing the Webpage**: Once deployed and configured, access the webpage by navigating to the assigned DNS name in a web browser.

## Collaboration

- **GitHub Actions**: Automated Terraform deployments are set up using GitHub Actions, enabling seamless collaboration among team members.
- **Terraform State Management**: Utilize remote backend configurations for Terraform state to facilitate simultaneous work on infrastructure components.
- **Ansible Automation**: Configuration management of the deployed infrastructure is handled using Ansible playbooks, allowing for consistent and reproducible setups.

## Contributing

This project follows a trunk-based development approach, where all changes are made directly to the main branch

### Continuous Integration (CI) Process

This repository utilizes a CI process to ensure the stability and quality of the codebase. Upon each pull request or push to the main branch, the CI pipeline is triggered automatically. The pipeline includes:

- **Linting**: Code is checked for adherence to coding standards and best practices.
- **Unit Testing**: Automated tests are executed to verify the functionality of the code.
- **Infrastructure Deployment**: Terraform scripts are applied to provision and update the infrastructure as needed.
- **Ansible Configuration**: Ansible playbooks are run to configure the deployed infrastructure.

Please ensure that all tests pass successfully before submitting your changes. If you encounter any issues with the CI process, feel free to reach out to the maintainers for assistance.


## Workflow Steps

```plaintext
+-------------------+    +-------------------+    +-------------------+    +-------------------+    +-------------------+
|                   |    |                   |    |                   |    |                   |    |                   |
|   Pull Request    |    |   Code Review     |    |   Continuous      |    |     Approval      |    |      Merging      |
|   Creation        | -> |                   | -> |   Integration     | -> |                   | -> |                   |
|                   |    |                   |    |                   |    |                   |    |                   |
+-------------------+    +-------------------+    +-------------------+    +-------------------+    +-------------------+


