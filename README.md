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
```


This GitHub Actions workflow automates the deployment of infrastructure changes using Terraform and additional configurations using Ansible. It consists of two main jobs:

## Terraform Unit Tests Workflow

This GitHub Actions workflow automates the process of running unit tests for Terraform code. It ensures that the Terraform configuration files are valid, correctly formatted, and pass security checks using Checkov.

### Workflow Triggers

- **Manual Trigger**: This workflow can be manually triggered using the "workflow_dispatch" event.
- **Pull Request Trigger**: It also runs automatically on pull requests targeting the main branch.

### Steps

1. **Checkout**: This step checks out the repository to the GitHub Actions runner.
   
2. **Setup Terraform**: Installs the latest version of Terraform CLI and configures the Terraform CLI configuration file with a Terraform Cloud user API token.

3. **Terraform Init**: Initializes the Terraform working directory by setting up the necessary files, loading remote state, and downloading modules.

4. **Terraform Validate**: Validates the Terraform configuration files to ensure their syntax and structure are correct.

5. **Terraform Format**: Checks that all Terraform configuration files adhere to a canonical format.

6. **Run Checkov action**: Performs a security scan of the Terraform code using Checkov. It checks for compliance and security issues based on best practices and common pitfalls.


### Note

You can customize this workflow to suit your specific requirements by modifying the workflow file (`terraform-unit-tests.yml`).


This workflow assumes the presence of Terraform configuration files in a directory named "infrastructure" and an Ansible playbook named "playbook.yml" in the root directory. Additionally, it expects an RSA private key stored in GitHub secrets for SSH authentication during the Ansible deployment. Make sure the directory structure and file names match your project setup, and adjust the configurations accordingly.

# CICD

### Terraform Plan Job:
- **Trigger:** This job is triggered on pushes to the main branch, pull requests targeting the main branch, or manual execution through the GitHub Actions UI.
- **Purpose:** The purpose of this job is to generate a Terraform execution plan, check the formatting of Terraform files, and publish the plan summary.

### Terraform Apply Job:
- **Trigger:** This job is triggered only if the workflow was triggered by a push to the main branch (not pull requests), and if the Terraform plan indicates there are pending changes (exit code 2).
- **Purpose:** The purpose of this job is to apply the Terraform plan generated in the previous job and deploy infrastructure changes. Additionally, it sets up SSH authentication and runs an Ansible playbook for additional configuration.

**So, to summarize:**
- The Terraform Plan job is triggered on any push to the main branch or any pull request targeting the main branch. It focuses on planning infrastructure changes and posting the plan summary.
- The Terraform Apply job is triggered only on pushes to the main branch, specifically when the Terraform plan indicates there are pending changes (exit code 2). It applies the Terraform plan and executes an Ansible playbook for further configuration.  
  
    
# Ansible 

## Workflow Triggers:
- This workflow is triggered by:
  - Manual execution through the GitHub Actions UI (`workflow_dispatch`).
  - Pushes to branches starting with "feature/" (`push`).

## Job: run-playbooks
- **Description:** This job executes Ansible playbooks for deploying NGINX configurations.
- **Runs on:** Ubuntu latest environment.

### Steps:
1. **Checkout:**
   - Checks out the repository to the GitHub Actions runner.
   
2. **Setup SSH:**
   - Sets up SSH authentication for accessing the deployment server.
   - Starts the SSH agent and configures the SSH private key.
   - Adds the deployment server's SSH key to the known hosts.
   
3. **Run Ansible script:**
   - Checks the SSH service status.
   - Displays the content of the `deployngix.yml` Ansible playbook.
   - Executes the Ansible playbook (`deployngix.yml`) with verbose output, specifying the private key for authentication, the target user (`azureadmin`), and the inventory host (`bhs-task-loc.northeurope.cloudapp.azure.com`).
