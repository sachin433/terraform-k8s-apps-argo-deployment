variable "environment" {
  description = "Environment"
  type = string
}

variable "custom_names" {
  description = "Map of the Custom Service names to be deployed in environment [ Custom Developed Application ]"
  type = map(string)
  default = null
}

variable "destination_cluster" {
  description = "Kubernetes Cluster where application will be deployed"
  type = string
}

variable "infra_helm_apps" {
  description = "Deails of the Infra Helm Applications"
  type = list(
    object(
      {
        service_name  = string
        namespace = string
        repo_url = string
        helm_chart_path = string
        environment_file_name = string
        release_name = string
        target_revision = string
      }
    )
  )
}