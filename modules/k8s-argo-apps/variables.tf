variable "environment" {
  description = "Env"
  type = string
}

variable "service_name" {
  description = "Name fo the Service or App [ Deployed Infra Application (Helm Chart) ]"
  type = string
}

variable "destination_cluster" {
  description = "Kubernetes Cluster where application will be deployed"
  type = string
}

variable "namespace" {
  description = "Namespace of kubernetes cluster where application will be deployed."
  type = string
}

variable "target_revision" {
  description = "Target revision of the Helm Chart Repository for which Application Needs to created"
  type = string
  default="master"
}

variable "repo_url" {
  description = "Url of the Helm Chart Repository"
  type = string
}

variable "environment_file_name" {
  description = "Environment File name for values."
  type = string
}

variable "release_name" {
  description = "release_name for the Helm Application need to be Deployed."
  type = string
}

variable "helm_chart_path" {
  description = "helm_chart_path for the helm chart in the provided repository."
  type = string
  default = "./"
}