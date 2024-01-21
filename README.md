# Terraform ArgoCD Application Deployment

This GitHub repository contains Terraform scripts for automating the deployment of applications using ArgoCD with Helm in Kubernetes environments. The focus is on creating a seamless, automated deployment process for microservices across various environments like development, staging, and production.

## Overview

The Terraform script configures an ArgoCD Application resource, automating the deployment of applications packaged as Helm charts into a Kubernetes cluster. Customization options for different deployment environments allow for tailored application deployment strategies.

## Features

- **ArgoCD Integration**: Direct integration with ArgoCD for Kubernetes application management.
- **Helm Chart Deployment**: Automated deployment of applications using Helm charts.
- **Environment-Specific Configuration**: Customizable settings for different deployment environments (e.g., development, staging, production).
- **Resource Lifecycle Management**: Control over the lifecycle of the deployed resources in Kubernetes.

## Prerequisites

- **Terraform Installed**: Ensure Terraform is installed on your machine.
- **Kubernetes Cluster**: Access to a Kubernetes cluster where applications are deployed.
- **ArgoCD Setup**: ArgoCD should be installed and configured on the Kubernetes cluster.

## Provider Configuration

The code uses the `argocd` provider, specified with a version constraint:

```hcl
terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "5.6.0"
    }
  }
}

## Resource Configuration: `argocd_application`

This section details the configuration of the `argocd_application` resource in the Terraform script. This resource is pivotal for deploying applications using ArgoCD in Kubernetes environments, specifically tailored for Helm chart deployments.

## Metadata

- **Name**: Composed of the environment and service name.
- **Labels**: Key-value pairs for identifying the application.

## Spec

- **Project**: Specifies the ArgoCD project associated with the application.
- **Source**:
  - **repo_url**: URL of the source repository containing the Helm chart.
  - **path**: Path to the Helm chart in the repository.
  - **target_revision**: The specific version or branch of the chart to deploy.
- **Destination**:
  - **server**: The target Kubernetes cluster for the application deployment.
  - **namespace**: The Kubernetes namespace where the application will be deployed.

## Sync Policy

- Defines the synchronization approach for the application within ArgoCD.

## Lifecycle

- **ignore_changes**: This parameter allows you to specify attributes that Terraform should ignore during subsequent updates.

## Usage

### Step 1: Configuration

Customize the deployment settings by setting the following variables:

- `environment`
- `service_name`
- `repo_url`
- `helm_chart_path`
- `target_revision`
- `environment_file_name`
- `release_name`
- `destination_cluster`
- `namespace`

### Step 2: Initialization

Run the following command to initialize Terraform:

```shell
terraform init
